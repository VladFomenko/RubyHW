# frozen_string_literal: true

# Articles controller
module Api
  module V1
    # class ArticlesController
    class ArticlesController < ApplicationController
      before_action :set_author, only: %i[index create show set_article]
      before_action :set_article, except: %i[index]

      def index
        render json: @author.articles, status: :ok
      end

      def create
        @article = @author.articles.new(article_params)
        if @article.valid?
          @article.save
          render json: @article, status: :ok
        else
          render json: @article.errors, status: :not_found
        end
      end

      def show
        if @article.nil?
          render json: @article.errors, status: :not_found
        else
          render json: { article: @article, comments: @article.comments }, status: :ok
        end
      end

      def update
        if @article.update(article_params)
          render json: @article, status: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      def destroy
        render json: @article, status: :ok if @article.destroy
      end

      private

      def set_article
        @article = @author.articles.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @article = nil
      end

      def set_author
        @author = Author.find(params[:author_id])
      end

      def article_params
        params.require(:authors).require(:articles).permit(:title, :body)
      end
    end
  end
end
