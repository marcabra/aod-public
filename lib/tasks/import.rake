require 'csv'
namespace :import do
  
  desc 'Import CRS codes'
  task :crs => :environment do
    CSV.foreach("#{Rails.root}/vendor/data/crs.csv", headers: true, col_sep: ';') do |row|
      ancestry = Topic.find_by_code(row['parent_code'])
      if ancestry
        Topic.create(code: row['code'], name: row['name'], ancestry: ancestry.id)
      else
        Topic.create(code: row['code'], name: row['name'])
      end
    end
  end
  
end
