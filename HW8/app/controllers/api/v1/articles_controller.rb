# frozen_string_literal: true

# Articles controller
module Api
  module V1
    # class ArticlesController
    class ArticlesController < ApplicationController
      before_action :set_author, except: %i[destroy filtration_articles search_current_value]
      before_action :set_article, only: %i[create show update destroy]
      before_action :set_article_id, only: %i[last_ten_comments published unpublished]
      after_action :set_tag, only: %i[create update]

      def index
        render json: @author.articles
      end

      def create
        @article = @author.articles.new(article_params)
        if @article.valid?
          @article.save
          render json: { article: @article, tags: @article.tags }, status: :created
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
        render json: { article: @article, comments: @article.comments.unpublished }, status: :ok
      end

      def published
        render json: { article: @article, comments: @article.comments.published }, status: :ok
      end

      def last_ten_comments
        render json: Article.last_ten(@article), status: :ok
      end

      def search_current_value
        article = Article.where('title LIKE ? OR body LIKE ?', "%#{params[:word]}%", "%#{params[:word]}%")
        if article.blank?
          render json: {}, status: :not_found
        else
          render json: article, status: :ok
        end
      end

      def filtration_articles
        render json: Article.joins(:tags).order(set_filter_params)
      end

      private

      def set_author
        @author = Author.find(params[:author_id])
      end

      def set_article
        @article = @author.articles.find_by!(id: params[:id])
      end

      def set_article_id
        @article = @author.articles.find_by!(id: params[:article_id])
      end

      def set_tag
        if @article.tags.find_by(title: params[:authors][:tag]).nil?
          @article.tags.create(title: params[:authors][:tag])
        else
          @article.tags.update(title: params[:authors][:tag])
        end
      end

      def set_filter_params
        [status: params[:status], tags: params[:tags], author: params[:author]].map(&:compact).map(&:keys).flatten
      end

      def article_params
        params.require(:authors).require(:articles).permit(:title, :body, :status, :article_id)
      end
    end
  end
end
