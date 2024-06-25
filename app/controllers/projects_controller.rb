class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update]

  def index
    @projects = Project.all
  end

  def edit
    @project_form = ProjectForm.new(id: @project.id)
    @project_form.build_empty_comment
  end

  def update
    @project_form = ProjectForm.new(id: @project.id)
    if @project_form.update(project_params)
      redirect_to projects_path, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:status_id, comments_attributes: %i[id text _destroy])
  end
end
