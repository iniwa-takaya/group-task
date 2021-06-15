class TasksController < ApplicationController
  def index
    @task = Task.new
    @task_group = TaskGroup.find(params[:task_group_id])
    @space = @task_group.spaces.includes(:task_group).find(params[:space_id])
    @tasks = @space.tasks.includes(task_group: :space)
  end

  def create
    @task_group = TaskGroup.find(params[:task_group_id])
    @space = @task_group.spaces.includes(:task_group).find(params[:space_id])
    @task = @space.tasks.new(task_params)
    if @task.save
      redirect_to task_group_space_tasks_path(@task_group, @space)
    else
      @task_group = TaskGroup.find(params[:task_group_id])
      @space = @task_group.spaces.includes(:task_group).find(params[:space_id])
      @tasks = @space.tasks.includes(task_group: :space)
      render :index
    end
  end

  def edit
    @task_group = TaskGroup.find(params[:task_group_id])
    @space = @task_group.spaces.includes(:task_group).find(params[:space_id])
    @task = Task.find(params[:id])
  end

  def update
    @task_group = TaskGroup.find(params[:task_group_id])
    @space = @task_group.spaces.find(params[:space_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_group_space_tasks_path(@task_group, @space)
    else
      @task_group = TaskGroup.find(params[:task_group_id])
      @space = @task_group.spaces.includes(:task_group).find(params[:space_id])
      @tasks = @space.tasks.includes(task_group: :space)
      render :edit
    end
  end

  def destroy
    @task_group = TaskGroup.find(params[:task_group_id])
    @space = @task_group.spaces.find(params[:space_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to task_group_space_tasks_path(@task_group, @space)
  end

  private

  def task_params
    params.require(:task).permit(:content, :deadline, :status).merge(task_group_id: @task_group.id, space_id: @space.id)
  end
end
