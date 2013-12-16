class AddDepthCacheToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :ancestry_depth, :integer, default: 0
    Topic.rebuild_depth_cache!
  end
end
