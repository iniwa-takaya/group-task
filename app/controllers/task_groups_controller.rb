class TaskGroupsController < ApplicationController
  
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

  private

  def task_group_params
    params.require(:task_group).permit(:g_name, :g_description, user_ids: [])
  end
end
