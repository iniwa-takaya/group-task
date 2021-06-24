class TasksController < ApplicationController
  before_action :find_task_group, only: %i[index create edit update destroy]
  before_action :find_space, only: %i[index create edit update destroy]
  before_action :find_task, only: %i[edit update destroy]

  def index
    @task = Task.new
  end

  def create
    @task = @space.tasks.new(task_params)
    if @task.save
      redirect_to task_group_space_tasks_path(@task_group, @space)
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_group_space_tasks_path(@task_group, @space)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to task_group_space_tasks_path(@task_group, @space)
  end

  private

  def find_task
    @task = @space.tasks.includes(:space).find(params[:id])
  end

  def find_space
    @space = @task_group.spaces.includes(:task_group).find(params[:space_id])
  end

  def find_task_group
    @task_group = TaskGroup.find(params[:task_group_id])
  end

  def task_params
    params.require(:task).permit(:content, :deadline, :status).merge(task_group_id: @task_group.id, space_id: @space.id)
  end
end
