class Cart < ApplicationRecord
  has_many :line_items, dependent: :destory
end
