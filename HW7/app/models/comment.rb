# frozen_string_literal: true

# class Comment
class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article

  validates :body, presence: true
  validates :body, length: { minimum: 3 }
  validates :article_id, presence: true
  validates :author_id, presence: true

  scope :all_comments, ->(article_id) { where('article_id = ?', article_id) }
  scope :last_ten, ->(article_id) { where('article_id = ?', article_id).order('created_at Desc').limit(10) }

  enum status: %i[unpublished published]
end
