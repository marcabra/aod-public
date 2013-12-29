json.name "topics" 
json.children do 
  json.partial! 'topics/topic', collection: @topics, as: :topic
end