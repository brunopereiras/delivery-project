class ProductCategory < ApplicationRecord
  belongs_to :establishment
  has_many :products
end
