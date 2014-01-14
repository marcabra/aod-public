class TopicsController < ApplicationController
  def index
    @parent = Topic.find(params[:parent]) if params[:parent].present?
    @topics = @parent.nil? ? Topic.roots : @parent.children
    
    @topics.delete_if { |t| t.amount(current_year) == 0 }
    @grand_total = @topics.sum { |t| t.amount(current_year) }
    
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
