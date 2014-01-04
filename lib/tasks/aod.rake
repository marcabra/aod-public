namespace :aod do

  task :merge_regions => :environment do
    regions = Region.find_by_sql("select min(id) as id, name from regions group by name having count(*) > 1")
    regions.each do |region|
      similar = Region.where("name = :name and id != :id", name: region.name, id: region.id).pluck(:id)
      Project.where("region_id in (:similar)", similar: similar).update_all(region_id: region.id) 
      Region.where("id in (:similar)", similar: similar).delete_all
    end
  end

end