class TopicsController < ApplicationController
  def index
    @topics = Topic.by_year(current_year).select("topics.*, sum(aids.committed_amount) as committed_amount").group("topics.id")
  end

  def show
    @topic = Topic.find(params[:id])
    
    @regions = Region.by_topic(@topic, current_year)
    @agencies = Agency.by_topic(@topic, current_year)    
    @projects = @topic.projects.by_year(current_year).order_by_amount.limit(5)

    gon.aids = @topic.aids.group("year").select("cast(year as varchar), sum(aids.committed_amount) as amount")
  end
end
