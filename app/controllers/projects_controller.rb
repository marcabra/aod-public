class ProjectsController < ApplicationController
  respond_to :html
  respond_to :json, only: [:index]

  def index
    @projects = Project.joins(:region, :aids, :agencies, :topic).where("aids.year = :year", year: current_year).order("#{sort_column} #{sort_direction}")
    if params[:sSearch].present?
      @projects = @projects.where("projects.title ilike :search or regions.name ilike :search or topics.name ilike :search or agencies.name ilike :search", search: "%#{params[:sSearch]}%")
    end
    @projects = @projects.page(page).per_page(per_page)
    
    gon.defaultSearch = params[:sSearch] || ''

    respond_with(@projects)
  end

  def show
    @project = Project.find(params[:id])
    @related_projects = @project.region.projects.limit(5)
  end

  private
  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w(regions.name title aids.paid_amount agencies.name topics.name)
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
