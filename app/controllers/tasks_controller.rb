class TasksController < Base

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def edit
    @task = Task.find(params[:id])
  end

end
