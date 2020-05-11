class Parlaiment < ApplicationRecord
  belongs_to :user
  has_many :parlaiment_articles
  has_many :articles, through: :parlaiment_articles
  validates :user_id, presence: true
  validates :name, presence: true
end
