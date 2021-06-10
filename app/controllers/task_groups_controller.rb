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

  def destroy
    @task_group = TaskGroup.find(params[:id])
    binding.pry
    @task_group.destroy
    redirect_to root_path
  end

  private

  def task_group_params
    params.require(:task_group).permit(:g_name, :g_description, user_ids: [])
  end
end
