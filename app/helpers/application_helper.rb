module ApplicationHelper
  def ratio(amount, grand_total)
    number_to_percentage (amount.to_f / grand_total.to_f) * 100, precision: 2
  end
end
