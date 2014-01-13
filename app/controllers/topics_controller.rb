class TopicsController < ApplicationController
  def index
    @topics = Topic.roots
    gon.current_year = @current_year
  end

  def show
    @topic = Topic.find(params[:id])
    
    @regions = Region.by_topic(@topic, current_year)
    @agencies = Agency.by_topic(@topic, current_year)    
    @projects = @topic.projects.by_year(current_year).order("paid_amount desc").limit(5)

    gon.aids = @topic.aids.group("year").select("cast(year as varchar), sum(aids.paid_amount) as amount")
  end
end
