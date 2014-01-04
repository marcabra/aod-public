require 'csv'
namespace :import do
  
  desc 'Import CRS codes'
  task :crs => :environment do
    CSV.foreach("#{Rails.root}/vendor/data/crs.csv", headers: true, col_sep: ';') do |row|
      Topic.create(code: row['code'], name: row['name'], parent: Topic.find_by_code(row['parent_code']))
    end
  end
  
  desc 'Import Geodata'
  task :geodata => :environment do
    CSV.foreach("#{Rails.root}/vendor/data/geodata.csv", headers: true, col_sep: ';') do |row|
      Geodata.create(the_geom: row['the_geom'], name: row['name'], iso_code: row['iso2'], region: row['region'], subregion: row['subregion'], lon: row['lon'], lat: row['lat'])
    end
  end
  
  desc 'Import projects'
  task :projects, [:year] => :environment do |t, args|
    CSV.foreach("#{Rails.root}/vendor/data/#{args[:year]}.csv", headers: true, col_sep: ';') do |row|
      topic = Topic.find_by_code(row['topic'])
      if topic.present?
        agency = Agency.find_or_create_by_name(name: row['agency'], organism: row['organism'], organism_kind: row['organism_kind'])
        
        region = Region.find_or_create_by_name(name: row['region'], area: row['area'])
        region.incomes.find_or_create_by_year(year: row['year'], code: row['income'])
        
        project = Project.new(title: row['title'],
            description: row['description'],
            location: row['location'],
            started_at: row['start_date'],
            ended_at: row['end_date'],
            duration: row['duration'],
            aid_kind: row['aid_kind'],
            aid_via: row['aid_via'],
            odm: row['odm'],
            meta_odm: row['meta_odm'],
            beneficiaries_kind: row['beneficiaries_kind'],
            beneficiaries_count: row['beneficiaries_count'],
            beneficiaries_women: row['beneficiaries_women'],
            result: row['result'],
            intervention_number: row['intervention_number'],
            internal_code: row['internal_code'], 
            region: region,
            topic: topic)
          
          committed_amount =  row['committed_amount'].gsub('.', '').gsub(',','.').to_f
          paid_amount =  row['paid_amount'].gsub('.', '').gsub(',','.').to_f
          project.aids.build(agency: agency, year: row['year'], committed_amount: committed_amount, paid_amount: [paid_amount, 0].max, returned_amount: [paid_amount, 0].min.abs)
        begin
          project.save
        rescue Exception => e
          p "Problem with project #{row['title']}: #{e}"
        end
      else
        p "Topic not valid: #{row['topic']}"
      end
    end
  end
  
end
