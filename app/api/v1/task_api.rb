module TaskApi
  class APIv1 < Grape::API
    format :json
    default_format :json
    version "v1",using: :path

    helpers do
      def task_params
        ActionController::Parameters.new(params).permit(:title,:description,:checked)
      end
    end

    resource :task do

      desc "idで指定されたtask取得"
      #GET /api/v1/task/:id
      get ':id' do
        Task.find(params[:id])
      end

      desc "task一覧取得"
      #GET /api/v1/task
      get  do
        Task.all
      end

      desc "taskをアップデート"
      params do
        requires :title, type: String, desc: 'title'
        requires :description, type: String, desc: 'description'
        requires :checked, type: Boolean, desc: 'checked'
        requires :group_id, type: Integer, desc: 'group_id'
      end
      put ':id' do
        Task.find(params[:id]).update({
                                        title:params[:title],
                                        description:params[:description],
                                        checked:params[:checked],
                                        group_id:params[:group_id]
                                       })
      end

      desc "taskを削除"
      delete ':id' do
        Task.destroy(params[:id])
      end

    end
  end
end

