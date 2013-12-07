class RegionsController < ApplicationController
  def index
  end

  def show
    @region = Region.find(params[:id])
    @all_regions_amount = Aid.where("paid_amount > 0").sum(:committed_amount)

    @topics = Topic.by_region(@region, current_year)
    @agencies = Agency.by_region(@region, current_year)
    @projects = @region.projects.by_year(current_year).order("committed_amount desc").limit(5)

    gon.aids = @region.aids.group_by_year
  end
end
