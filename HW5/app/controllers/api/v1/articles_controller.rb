# frozen_string_literal: true

class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, except: [:index, :create]

  def index
    @articles = Article.all
    render json: @articles
  end

  def create
    @article = Article.create(person_params)
    if @article.save
      render json: @article
    else
      render json: @article
    end
  end

  def show
    render json: @article
  end

  def update
    if @article.update(person_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render plain: 'Deletion successful' if @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def person_params
    params.require(:article).permit(:title, :body)
  end

end
