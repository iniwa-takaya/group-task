class SpacesController < ApplicationController
  before_action :find_task_group, only: %i[index create] 

  def index
    @space = Space.new
    @spaces = @task_group.spaces.includes(:task_group)
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to task_group_spaces_path(@task_group)
    else
      @spaces = @task_group.spaces.includes(:task_group)
      render :index
    end
  end

  private

  def find_task_group
    @task_group = TaskGroup.find(params[:task_group_id])
  end

  def space_params
    params.require(:space).permit(:s_name, :s_description).merge(task_group_id: @task_group.id)
  end
end
