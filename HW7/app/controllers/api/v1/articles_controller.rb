# frozen_string_literal: true

# Articles controller
module Api
  module V1
    # class ArticlesController
    class ArticlesController < ApplicationController
      before_action :set_author, except: %i[destroy]
      refactor      before_action :set_article, except: %i[index last_ten_comments unpublished published last_ten]
      after_action :set_tag, only: %i[create update]

      def index
        render json: @author.articles
      end

      def create
        @article = @author.articles.new(article_params)
        if @article.valid?
          @article.save
          render json: @article
        else
          render json: @article.errors, status: :not_found
        end
      end

      def show
        if @article.nil?
          render json: @article.errors, status: :not_found
        else
          render json: {
            article: @article,
            comments: @article.comments,
            tags: @article.tags,
            likes: @article.likes.count
          }, status: :ok
        end
      end

      def update
        if @article.update(article_params)
          render json: @article, status: :ok
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def destroy
        render json: @article, status: :ok if @article.destroy
      end

      def unpublished
        @article = Article.find(params[:article_id])
        render json: { article: @article, comments: @article.comments.unpublished }, status: :ok
      end

      def published
        @article = Article.find(params[:article_id])
        render json: { article: @article, comments: @article.comments.unpublished }, status: :ok
      end

      def last_ten_comments
        @article = Article.find(params[:article_id])
        render json: Comment.last_ten(@article), status: :ok
      end

      private

      def set_author
        @author = Author.find(params[:author_id])
      end

      def set_article
        @article = @author.articles.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @article = nil
      end

      def set_tag
        return if params[:authors][:tag].blank?

        if @article.tags.find_by(title: params[:authors][:tag]).nil?
          @article.tags.create(title: params[:authors][:tag])
        else
          @article.tags.update(title: params[:authors][:tag])
        end
      end

      def article_params
        params.require(:authors).require(:articles).permit(:title, :body, :status, :article_id)
      end
    end
  end
end
