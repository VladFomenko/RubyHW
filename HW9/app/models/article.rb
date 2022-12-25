# frozen_string_literal: true

# class Article
class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
  has_and_belongs_to_many :tags

  validates :body, presence: true, length: { minimum: 3 }
  validates :title, presence: true, length: { minimum: 3 }

  enum status: %i[unpublished published]

  scope :unpublished, -> { where('status = 0') }
  scope :published, -> { where('status = 1') }
  scope :last_ten, ->(article_id) { find_by('id = ?', article_id).comments.order('created_at DESC ').limit(10) }
  scope :search_author, ->(author_name) { joins(:author).where('authors.name = ?', author_name) }
  scope :search_status, ->(status) { where(status: status) }
  scope :search_tags, ->(tags) { joins(:tags).where({ tags: { title: '?' } }, tags) }
  scope :search_tags, ->(tags) { joins(:tags).where({ tags: { title: tags } }) }
end
