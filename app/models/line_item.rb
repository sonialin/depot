class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
    product.price * quantity
  end

  # to decrease quantity of line items in cart
  def decrement_quantity(line_item_id)
    current_item = LineItem.find_by_id(line_item_id)

    if current_item.quantity > 1
      current_item.quantity -= 1
    else
      current_item.destroy
    end

    current_item
  end

  def increment_quantity(line_item_id)
    current_item = LineItem.find_by_id(line_item_id)
    current_item.quantity += 1
    current_item
  end
end
