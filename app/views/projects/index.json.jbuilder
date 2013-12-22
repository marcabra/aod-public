json.sEcho params[:sEcho].to_i
json.iTotalRecords @projects.total_entries
json.iTotalDisplayRecords @projects.count
json.aaData do 
  json.array! @projects.collect do |p|
    json.array! [link_to(p.region.name, p.region), link_to(p.title, p), number_to_currency(p.paid_amount), link_to(p.agencies.first.name, p.agencies.first), link_to(p.topic.name, p.topic)]
  end
end
