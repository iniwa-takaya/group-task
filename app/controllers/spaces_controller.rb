class SpacesController < ApplicationController
  def index
    @task_group = TaskGroup.find(params[:task_group_id])
  end
end
