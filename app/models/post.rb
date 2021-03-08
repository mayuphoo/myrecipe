class Post < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :category
  
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
