require 'csv'
namespace :export do
  
  desc 'Export topics'
  task :topics => :environment do
    CSV.open("topics.csv", "wb", col_sep: ';') do |csv|
      csv << ["code", "name", "ancestry"]
      Topic.all.each do |topic|
        csv << [topic.code, topic.name, topic.ancestry]
      end
    end
  end  
  
  desc 'Export geodata'
  task :geodata => :environment do
    CSV.open("geodata.csv", "wb", col_sep: ';') do |csv|
      csv << ["region_id", "name", "iso_code", "year", "amount", "the_geom"]
      data = Region.find_by_sql(%Q(select regions.id, regions.name, geodata.iso_code, aids.year, sum(aids.committed_amount) as committed_amount, geodata.the_geom
                  from regions
                  inner join geodata on regions.name = geodata.name
                  inner join projects on regions.id = projects.region_id
                  inner join aids on projects.id = aids.project_id                  
                  group by regions.id, geodata.id, aids.year))
      data.each do |d|
        csv << [d.id, d.name, d.iso_code, d.year, d.committed_amount, d.the_geom]
      end
    end
  end
  
  desc 'Export regions'
  task :regions => :environment do 
    CSV.open("regions.csv", "wb", col_sep: ';') do |csv|
      csv << ["region_id", "name", "iso_code"]
      data = Region.find_by_sql(%Q(select regions.id, regions.name, regions.iso_code
                  from regions
                  order by regions.name))
      data.each do |d|
        csv << [d.id, d.name, d.iso_code]
      end
    end
  end
  
end