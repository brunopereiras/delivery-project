class Establishment < ApplicationRecord

  belongs_to :user
  has_many :product_categories

  validates :name, length: { in: 3..200 }

  before_save :set_link_name

  private

    def set_link_name
      self.link_name = self.name.parameterize
    end

end
