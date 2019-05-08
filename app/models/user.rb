class User < ApplicationRecord
  validates :name, presence: true
  validates :name,length: {maximum: 15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  validates :password, presence: true, length: { in:8..32 }
  /(?=.{8,})(?=.*\d+.*)(?=.*[a-zA-Z]+.*).*[!@#$%]+.*/
  
 has_many :topics
 has_many :favorites
 has_many :favorite_topics, through: :favorites, source: 'topic'
end
