class TaskGroupsController < ApplicationController
  before_action :find_task_group, only: %i[edit update destroy]

  def index
  end

  def new
    @task_group = TaskGroup.new
    @task_group.users << current_user
  end

  def create
    @task_group = TaskGroup.new(task_group_params)
    if @task_group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task_groups = current_user.task_groups
    if @task_group.update(task_group_params)
      redirect_to task_group_spaces_path(@task_group)
    else
      render :edit
    end
  end

  def destroy
    @task_group.destroy
    redirect_to root_path
  end

  private

  def find_task_group
    @task_group = TaskGroup.find(params[:id])
  end

  def task_group_params
    params.require(:task_group).permit(:g_name, :g_description, user_ids: [])
  end
end
