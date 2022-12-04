# frozen_string_literal: true

# class Api::V1::CommentsController
module Api
  module V1
    # class CommentsController
    class CommentsController < ApplicationController
      before_action :set_author, only: %i[index create set_comment]
      before_action :set_comment, only: %i[show update destroy]
      before_action :set_article, only: %i[create]

      def index
        @comments = @author.comments
        @comments = @author.comments.where(status: comment_params[:status]) if comment_params[:status].present?

        render json: @comments, status: :ok
      end

      def show
        render json: @comment
      end

      def create
        @comment = @author.comments.new(comment_params)
        if @comment.valid?
          @comment.save
          render json: @comment, status: :ok
        else
          render json: @comment, status: :not_acceptable
        end
      end

      def update
        render json: @comment, status: :ok if @comment.update(comment_params)
      end

      def destroy
        render json: @comment, status: :ok if @comment.destroy
      end

      private

      def set_article
        if comment_params[:article_id].is_a?(Integer)
          begin
            @article = Article.find(comment_params[:article_id])
          rescue ActiveRecord::RecordNotFound
            render json: @article, status: :not_found
          end
        else
          render @article, status: :not_found
        end
      end

      def set_comment
        @comment = @author.comments.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: @comment, status: :not_found
      end

      def set_author
        @author = Author.find(params[:author_id])
      end

      def comment_params
        params.require(:authors).require(:comments).permit(:body, :article_id, :status)
      end
    end
  end
end
