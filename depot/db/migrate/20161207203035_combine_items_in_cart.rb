class CombineItemsInCart < ActiveRecord::Migration[5.0]
  def change
  end

  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        next unless quantity > 1
        cart.line_items.where(product_id: product_id).delete_all

        item = cart.line_items.build(product_id: product_id)
        item.quantity = quantity
        item.save!
      end
    end
  end
end
