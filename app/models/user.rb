class User < ApplicationRecord
  validates :username, presence: true,
                       length: { minimum: 3, maximum: 25 },
                       uniqueness: { case_sensitive: false }
  EMAIL_REGEX = VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: EMAIL_REGEX }
  has_many :articles
end
