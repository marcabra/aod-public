class RegionsController < ApplicationController
  def index
  end

  def show
    @region = Region.find(params[:id])
    @all_regions_amount = Aid.where("paid_amount > 0").sum(&:committed_amount)
    @topics = @region.projects.group_by_topics.where("aids.year = ?", current_year).limit(5)
    @projects = @region.projects.by_year(current_year).order_by_amount.limit(5)
    @agencies = @region.projects.by_year(current_year).group_by_agencies.limit(5)
    gon.aids = @region.aids.group_by_year
  end
end
