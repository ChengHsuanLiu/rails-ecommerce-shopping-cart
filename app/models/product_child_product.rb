class ProductChildProduct < ActiveRecord::Base
  belongs_to :product, class_name: :Product, foreign_key: :product_id
  belongs_to :child_product, class_name: :Product, foreign_key: :child_product_id
end
