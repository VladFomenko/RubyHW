# frozen_string_literal: true

# class Article
class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  has_many :likes, as: :likeable

  validates :body, presence: true
  validates :body, length: { minimum: 3 }
  validates :title, presence: true
  validates :title, length: { minimum: 3 }

  enum status: %i[unpublished published]

  scope :unpublished, -> { where('status = 0') }
  scope :published, -> { where('status = 1') }
end
