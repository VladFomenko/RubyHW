# frozen_string_literal: true

# Articles controller
module Api
  module V1
    # class ArticlesController
    class ArticlesController < ApplicationController
      before_action :set_article, except: %i[index]
      before_action :set_author, only: %i[index create show set_article]

      def index
        render json: @author.articles
      end

      def create
        @article = @author.articles.new(person_params)
        if @article.valid?
          @article.save
          render json: @article
        else
          render plain: 'Article not valid'
        end
      end

      def show
        if @article.nil?
          render plain: 'Not found article'
        else
          render json: { article: @article, comments: @article.comments }
        end
      end

      def update
        if @article.update(person_params)
          render json: @article
        else
          render plain: 'Update unsuccessfully'
        end
      end

      def destroy
        render plain: 'Deletion successful' if @article.destroy
      end

      private

      def set_article
        set_author
        begin
          @article = @author.articles.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          @article = nil
        end
      end

      def set_author
        @author = Author.find(params[:author_id])
      end

      def person_params
        params.require(:authors).require(:articles).permit(:title, :body)
      end
    end
  end
end
