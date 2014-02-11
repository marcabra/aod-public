class AgenciesController < ApplicationController
  def index  
    if params[:organism].present?
      @agencies = Agency.by_organism(params[:organism]).by_year(current_year).group("agencies.id").order("sum(aids.paid_amount) desc").having("sum(aids.paid_amount)>0").limit(25)
      @grand_total = to_thousands @agencies.sum { |a| a.amount(current_year) }
    elsif params[:kind].present?
      @organisms = Agency.by_kind(params[:kind]).by_year(current_year).group("organism").order("sum(aids.paid_amount) desc").sum("aids.paid_amount")
      @organisms.each { |k, v| @organisms[k] = to_thousands(v) }
      @grand_total = @organisms.values.sum{ |v| v.to_i }
    else
      @departments = to_thousands Agency.by_kind('Administración General del Estado').by_year(current_year).sum("aids.paid_amount")
      @regions = to_thousands Agency.by_kind('Comunidades Autónomas').by_year(current_year).sum("aids.paid_amount")
      @town_halls = to_thousands Agency.by_kind('Entidades Locales').by_year(current_year).sum("aids.paid_amount")
      @universities = to_thousands Agency.by_kind('Universidades').by_year(current_year).sum("aids.paid_amount")
      @grand_total = @departments + @regions + @town_halls + @universities
    end
  end

  def show
    @agency = Agency.find(params[:id])

    @regions = Region.by_agency(@agency, current_year)
    @topics = Topic.by_agency(@agency, current_year)
    @projects = @agency.projects.by_year(current_year).order("aids.paid_amount desc").limit(5)

    gon.aids = @agency.aids.group("year").select("cast(year as varchar), sum(aids.paid_amount) as amount")
  end
end

