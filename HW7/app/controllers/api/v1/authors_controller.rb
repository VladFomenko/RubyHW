# frozen_string_literal: true

# class Api::V1::AuthorsController
module Api
  module V1
    # class AuthorsController
    class AuthorsController < ApplicationController
      before_action :set_author, only: %i[show destroy]

      def index
        render json: Author.all
      end

      def show
        render json: @author
      end

      def create
        @author = Author.create
        render json: @author
      end

      def destroy
        render plain: 'Deletion successful' if @author.destroy
      end

      private

      def set_author
        @author = Author.find(params[:id])
      end
    end
  end
end
