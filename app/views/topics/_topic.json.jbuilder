amount = topic.amount(current_year).to_i

json.name topic.name
json.size amount if amount > 0
json.url topic_url(topic)
if topic.children.any?
  json.children do 
    json.partial! 'topics/topic', collection: topic.children, as: :topic
  end
end

