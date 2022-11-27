# frozen_string_literal: true

# Articles controller
class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, except: %i[index create]
  before_action :set_author, only: %i[index create show set_article]

  def index
    render json: @author.articles
  end

  def create
    @article = @author.articles.new(person_params)
    if @article.valid?
      @article.save
      render @article
    else
      render plain: 'Article not valid'
    end
  end

  def show
    render json: { article: @article, comments: @article.comments }
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
    @article = @author.articles.find(params[:id])
  end

  def set_author
    @author = Author.find(params[:author_id])
  end

  def person_params
    params.require(:authors).require(:articles).permit(:title, :body)
  end

end
