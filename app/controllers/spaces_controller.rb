class SpacesController < ApplicationController
  before_action :find_task_group, only: %i[index create edit update] 
  before_action :find_space, only: %i[edit update] 
  
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

  def edit
    @spaces = @task_group.spaces.includes(:task_group)
  end

  def update
    binding.pry
    if @space.update(space_params)
      redirect_to task_group_spaces_path(@task_group)
    else
      @spaces = @task_group.spaces.includes(:task_group)
      render :edit
    end
  end

  private

  def find_task_group
    @task_group = TaskGroup.find(params[:task_group_id])
  end
  
  def find_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:s_name, :s_description).merge(task_group_id: @task_group.id)
  end
end
