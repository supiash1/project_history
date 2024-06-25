class ProjectForm
  include ActiveModel::Model

  attr_accessor :project, :status_id, :statuses

  def initialize(project_attributes = {})
    @project = Project.find(project_attributes[:id])
    @statuses = Status.all
  end

  def build_empty_comment
    @project.comments.build
  end

  def update(attributes)
    project.assign_attributes(attributes)
    project.save
  end
end
