class CollectionList < ApplicationRecord
  belongs_to :user
  has_many :collection_list_articles, dependent: :destroy
  has_many :articles, through: :collection_list_articles
  validates :user_id, presence: true
  validates :name, presence: true
end
