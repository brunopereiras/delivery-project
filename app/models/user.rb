class User < ApplicationRecord

  belongs_to :user_type
  has_many :establishments

  has_secure_password

  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  before_save { self.email = email.downcase }

  validates :name, length: { in: 3..200 }
  validate :email_format

  validates :password, length: { in: 3..200 }, if: :should_validate_password?

  def destroy
    self.update_attribute(:active, false)
  end

  def is_admin?
    self.user_type.name == 'Administrador'
  end

  def is_client?
    self.user_type.name == 'Cliente'
  end

  def is_establishment?
    self.user_type.name == 'Estabelecimento'
  end

	private

    def should_validate_password?
      if new_record?
        true
      else
        password.present? || password_confirmation.present?
      end
    end

    def email_format
      errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
      user = User.find_by(email: self.email)
      errors.add(:email, :taken) unless user == nil || user.id == self.id
    end

end
