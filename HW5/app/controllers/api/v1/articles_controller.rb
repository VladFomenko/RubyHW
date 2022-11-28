# frozen_string_literal: true

# class ArticlesController
module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :set_article, except: %i[index create]

      def index
        @articles = Article.all
        render json: @articles
      end

      def create
        @article = Article.new(person_params)
        if @article.save
          render_article
        else
          render plain: 'Failed to create'
        end
      end

      def show
        render_article
      end

      def update
        if @article.update(person_params)
          render json: @article
        else
          render plain: 'Failed to update'
        end
      end

      def destroy
        render plain: 'Deletion successful' if @article.destroy
      end

      private

      def render_article
        render json: @article
      end

      def set_article
        @article = Article.find(params[:id])
      end

      def person_params
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
