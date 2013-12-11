json.name "Ayuda Oficial al Desarrollo" 
json.children do 
  json.partial! 'topics/topic', collection: @topics, as: :topic
end