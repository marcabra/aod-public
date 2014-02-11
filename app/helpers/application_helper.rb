module ApplicationHelper
  def ratio(amount, grand_total, options={})
    return '- %' if grand_total.to_f == 0
    options[:precision] ||= 2
    number_to_percentage (amount.to_f / grand_total.to_f) * 100, precision: options[:precision]
  end
  
  def bar_with(amount, grand_total)
    ((amount.to_f / grand_total.to_f) * 400).round
  end
  
  def topic_link(topic)
    if topic.has_children?
      link_to topic.name, topics_path(parent: topic.id)
    else
      link_to topic.name, topic
    end
  end
end
