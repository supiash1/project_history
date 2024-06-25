class ProjectHistoryController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @versions = PaperTrail::Version.where(parent_type: 'Project', parent_id: @project.id)
  end
end
