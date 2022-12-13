# frozen_string_literal: true

# class Comment
class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article
  has_many :likes, as: :likeable

  validates :body, presence: true, length: { minimum: 3 }
  validates :status, presence: true
  validates :article_id, presence: true
  validates :author_id, presence: true

  enum status: %i[unpublished published]
end
