class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @related_projects = @project.region.projects.limit(5)
  end
end
