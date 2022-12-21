# frozen_string_literal: true

class Api::V1::ArticleSerializer < ApplicationSerializer
  attributes :id, :title, :body, :created_at, :author

  def author
    Author.find(object.author_id).name
  end

  has_many :comments
end
