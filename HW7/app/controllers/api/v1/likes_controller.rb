# frozen_string_literal: true

# class Api::V1::CommentsController
module Api
  module V1
    # class LikesController
    class LikesController < ApplicationController
      before_action :set_article, only: %i[index create destroy]
      before_action :set_comment, only: %i[index create destroy]
      before_action :set_likes, only: %i[destroy]

      def index
        render json: check_where_like.likes.all, status: :ok
      end

      def create
        @like = check_where_like.likes.create(author_id: like_params[:author_id])
        render json: @like, status: :ok
      end

      def destroy
        @like.destroy
        render status: :ok
      end

      private

      def set_comment
        @comment = Comment.find(like_params[:comment_id])
      rescue ActiveRecord::RecordNotFound
        @comment = nil
      end

      def set_article
        @article = Article.find(like_params[:article_id])
      rescue ActiveRecord::RecordNotFound
        @article = nil
      end

      def check_where_like
        @article.present? ? @article : @comment
      end

      def set_likes
        @like = check_where_like.likes.find(params[:id])
      end

      def like_params
        params.permit(:author_id, :article_id, :comment_id)
      end
    end
  end
end
