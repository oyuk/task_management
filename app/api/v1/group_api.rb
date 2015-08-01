module GroupApi
  class APIv1 < Grape::API
    format :json
    default_format :json
    version "v1",using: :path

    helpers do
      def group_params
        ActionController::Parameters.new(params).permit(:title)
      end

      def task_params
        ActionController::Parameters.new(params).permit(:title,:description,:checked)
      end
    end

    resource :group do

      desc "idで指定されたgroup取得"
      #GET /api/v1/group/:id
      get ':id' do
        Group.find(params[:id])
      end

      desc "group一覧取得"
      #GET /api/v1/group
      get  do
        Group.all
      end

      desc "groupをアップデート"
      params do
        requires :title, type: String, desc: 'title'
      end
      put ':id' do
        Group.find(params[:id]).update({
                                         title:params[:title]
                                       })
      end

      desc "新しいgroupを登録"
      #POST /api/v1/group
      params do
        requires :title,type: String ,desc: 'title'
      end
      post do
        @group = Group.new(group_params)
        @group.save!

        #Return created
        status 201
      end

      desc "groupを削除"
      delete ':id' do
        Group.destroy(params[:id])
      end

      #Task
      route_param :group_id do
        resource :task do

          desc "task一覧取得"
          #GET /api/v1/group/:group_id/task
          get  do
            Group.find(params[:group_id]).tasks
          end

          desc "新しいtaskを登録"
          #POST /api/v1/group/:group_id/task
          params do
            requires :title,type: String ,desc: 'title'
            requires :description,type: String ,desc: 'description'
            requires :checked,type: Boolean ,desc: 'checked'
          end
          post do
            @group = Group.find_by_id(params[:group_id])
            @group.tasks.create(task_params)
            #Return created
            status 201
          end

        end
      end

    end
  end
end



