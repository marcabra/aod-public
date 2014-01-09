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
    include ActionView::Helpers::NumberHelper
    
    CSV.open("geodata.csv", "wb", col_sep: ';') do |csv|
      csv << ["region_id", "name", "iso_code", "year", "amount", "amount_es", "the_geom"]
      data = Region.find_by_sql(%Q(select regions.id, regions.name, geodata.iso_code, aids.year, sum(aids.paid_amount) as paid_amount, geodata.the_geom
                  from regions
                  inner join geodata on regions.iso_code = geodata.iso_code
                  inner join projects on regions.id = projects.region_id
                  inner join aids on projects.id = aids.project_id                  
                  group by regions.id, geodata.id, aids.year))
      data.each do |d|
        csv << [d.id, d.name, d.iso_code, d.year, d.paid_amount, number_with_delimiter(d.paid_amount, delimiter: '.', separator: ','), d.the_geom]
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