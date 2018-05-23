class UserType < ApplicationRecord

  has_many :users

  validates :name, presence: true

  def destroy
    self.update_attribute(:active, false)
  end

end
