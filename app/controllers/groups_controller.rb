class GroupsController < Base

  def index
  end

  def show
    @group = Group.find(params[:id])
  end

  def new

  end

end
