class SpacesController < ApplicationController
  before_action :find_task_group, only: %i[index create edit update destroy]
  before_action :find_space, only: %i[edit update destroy]
  before_action :find_spaces, only: %i[index edit]

  def index
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to task_group_spaces_path(@task_group)
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @space.update(space_params)
      redirect_to task_group_spaces_path(@task_group)
    else
      render :edit
    end
  end

  def destroy
    @space.destroy
    redirect_to task_group_spaces_path(@task_group)
  end

  private

  def find_task_group
    @task_group = TaskGroup.find(params[:task_group_id])
  end

  def find_spaces
    @spaces = @task_group.spaces.includes(:task_group)
  end

  def find_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:s_name, :s_description).merge(task_group_id: @task_group.id)
  end
end
