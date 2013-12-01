class TopicsController < ApplicationController
  def index
    @topics = Topic.by_year(current_year)
  end

  def show
    @topic = Topic.find(params[:id])
    @projects = @topic.projects.by_year(current_year).order_by_amount.limit(5)
    @regions = @topic.projects.by_year(current_year).group_by_regions.limit(5)
    @agencies = @topic.projects.by_year(current_year).group_by_agencies.limit(5)
    gon.aids = @topic.aids.group_by_year
  end
end
