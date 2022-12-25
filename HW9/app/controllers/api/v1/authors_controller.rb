# frozen_string_literal: true

# class Api::V1::AuthorsController
module Api
  module V1
    # class AuthorsController
    class AuthorsController < ApplicationController
      before_action :set_author, only: %i[show destroy]
      before_action :author_params, only: %i[create update]

      def index
        render json: Author.all, status: :ok
      end

      def show
        render json: @author, status: :ok
      end

      def create
        @author = Author.create(author_params)
        render json: @author, status: :ok
      end

      def update
        render json: @author, status: :ok if @author.update(author_params)
      end

      def destroy
        render status: :ok if @author.destroy
      end

      private

      def set_author
        @author = Author.find(params[:id])
      end

      def author_params
        params.require(:author).permit(:name)
      end
    end
  end
end
