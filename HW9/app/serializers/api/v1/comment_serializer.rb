# frozen_string_literal: true

class Api::V1::CommentSerializer < ApplicationSerializer
  attributes :id, :body, :status, :created_at, :author

  def author
    Author.find(object.author_id).name
  end
end
