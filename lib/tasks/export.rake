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
  
end