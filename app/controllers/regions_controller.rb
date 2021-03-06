class RegionsController < ApplicationController
  def index
    gon.current_year = current_year
  end

  def show
    @region = Region.find(params[:id])
    @all_regions_amount = Aid.sum(:paid_amount)

    @topics = Topic.by_region(@region, current_year)
    @agencies = Agency.by_region(@region, current_year)
    @projects = @region.projects.by_year(current_year).order("paid_amount desc").limit(5)

    gon.aids = @region.aids.group("year").select("cast(year as varchar), sum(aids.paid_amount) as amount")
  end
end
