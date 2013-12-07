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
  
  desc 'Import projects'
  task :projects => :environment do
    CSV.foreach("#{Rails.root}/vendor/data/2011.csv", headers: true, col_sep: ';') do |row|
      topic = Topic.find_by_code(row['topic'])
      if topic.present?
        agency = Agency.find_or_create_by_name(name: row['agency'], organism: row['organism'], organism_kind: row['organism_kind'])
        
        region = Region.find_or_create_by_name(name: row['region'], area: row['area'])
        region.incomes.find_or_create_by_year(year: row['year'], code: row['income'])
        
        project = Project.new(title: row['title'],
            description: row['description'],
            location: row['location'],
            started_at: row['started_at'],
            ended_at: row['ended_at'],
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
            
        project.aids.build(agency: agency, year: row['year'], committed_amount: row['committed_amount'], paid_amount: row['committed_amount'])
        begin
          project.save
        rescue Exception => e
          p "Problem with project #{row['title']}: #{e}"
        end
      else
        p "Topic #{row['topic']} not valid for project #{row['title']}"
      end
    end
  end
  
end
