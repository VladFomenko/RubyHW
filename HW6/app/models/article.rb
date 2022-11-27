class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy

  validates :body, presence: true
  validates :body, length: { minimum: 3 }
  validates :title, presence: true
  validates :title, length: { minimum: 3 }

end
