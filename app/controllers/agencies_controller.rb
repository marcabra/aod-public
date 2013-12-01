class AgenciesController < ApplicationController
  def index  
    @departments = Agency.by_kind('Ministerios').by_year(current_year).uniq.limit(10)
    @regions = Agency.by_kind('Comunidades Autónomas').by_year(current_year).uniq.limit(10)
    @town_halls = Agency.by_kind('Ayuntamientos').by_year(current_year).uniq.limit(10)
    @universities = Agency.by_kind('Universidades').by_year(current_year).uniq.limit(10)
  end

  def show
    @agency = Agency.find(params[:id])
    @projects = @agency.projects.by_year(current_year).order("aids.committed_amount desc").limit(5)
    @regions = @agency.projects.group_by_regions.where("aids.year = ?", current_year).limit(5)
    @topics = @agency.projects.group_by_topics.where("aids.year = ?", current_year).limit(5)
    gon.aids = @agency.aids.group_by_year
  end
end
