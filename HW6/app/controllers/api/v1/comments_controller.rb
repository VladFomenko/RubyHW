# frozen_string_literal: true

UNPUBLISHED = 0
PUBLISHED = 1

# class Api::V1::CommentsController
module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show update destroy]
      before_action :set_author, only: %i[index create]
      before_action :set_article, only: %i[create]

      def index
        if [UNPUBLISHED, PUBLISHED].include?(params[:status])
          render json: @author.comments.where(status: params[:status])
        else
          render json: @author.comments
        end
      end

      def show
        render json: @comment
      end

      def create
        @comment = @author.comments.new(person_params)
        if @comment.valid?
          @comment.save
          render json: @comment
        else
          render plain: 'Failed to save'
        end
      end

      def update
        render plain: 'Update succesful' if @comment.update(person_params)
      end

      def destroy
        render plain: 'Deletion successful' if @comment.destroy
      end

      private

      def set_article
        if person_params[:article_id].is_a?(Integer)
          begin
            @article = Article.find(person_params[:article_id])
          rescue ActiveRecord::RecordNotFound
            render plain: 'ActiveRecord::RecordNotFound'
          end
        else
          render plain: 'Record not found'
        end
      end

      def set_comment
        set_author
        begin
          @comment = @author.comments.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render plain: 'Comment not found'
        end
      end

      def set_author
        @author = Author.find(params[:author_id])
      end

      def person_params
        params.require(:authors).require(:comments).permit(:body, :article_id, :status)
      end
    end
  end
end
