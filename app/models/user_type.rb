class UserType < ApplicationRecord

    validates :name, presence: true

    def destroy
        self.update_attribute(:active, false)
    end

end
