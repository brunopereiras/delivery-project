class User < ApplicationRecord

  belongs_to :user_type

  has_secure_password

  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  before_save { self.email = email.downcase }

  validates :name, length: { in: 3..200 }
  validate :email_format

  validates :password, on: :create, length: { in: 3..200 }, confirmation: { case_sensitive: true }
  validates :password, on: :update, length: { in: 3..200 }, confirmation: { case_sensitive: true }, allow_blank: true

  def destroy
    self.update_attribute(:active, false)
  end

	private

    def email_format
      errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
      user = User.find_by(email: self.email)
      errors.add(:email, :taken) unless user == nil || user.id == self.id
    end

end
