class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article

  validates :body, presence: true
  validates :body, length: { minimum: 3 }
  validates :article_id, presence: true
  validates :author_id, presence: true

  enum status: [:unpublished, :published]
end
