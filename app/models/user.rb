class User < ActiveRecord::Base
  before_save {self.email = email.downcase}
  validates :extension, presence: true, length: {maximum: 4}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_and_belongs_to_many :games
  has_many :historical_scores
end
