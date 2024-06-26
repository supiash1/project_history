class ProjectHistoryController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @project_history = @project.history
  end
end
