class AgenciesController < ApplicationController
  def index  
    @departments = Agency.by_kind('Administración General del Estado').by_year(current_year).uniq.limit(10)
    @regions = Agency.by_kind('Comunidades Autónomas').by_year(current_year).uniq.limit(10)
    @town_halls = Agency.by_kind('Entidades Locales').by_year(current_year).uniq.limit(10)
    @universities = Agency.by_kind('Universidades').by_year(current_year).uniq.limit(10)
  end

  def show
    @agency = Agency.find(params[:id])

    @regions = Region.by_agency(@agency, current_year)
    @topics = Topic.by_agency(@agency, current_year)
    @projects = @agency.projects.by_year(current_year).order("aids.committed_amount desc").limit(5)

    gon.aids = @agency.aids.group("year").select("cast(year as varchar), sum(aids.committed_amount) as amount")
  end
end
