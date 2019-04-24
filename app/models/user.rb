class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,  presence: true,
                    length: {maximum: Settings.user.name.max_legth}
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.max_legth},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
                       length: {minimum: Settings.user.password.min_legth}
  before_save :downcase_email
  has_secure_password

  def downcase_email
    email.downcase!
  end
end
