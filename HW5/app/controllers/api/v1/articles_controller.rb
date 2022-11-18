class Api::V1::ArticlesController < ApplicationController
  def index
    render json: Article.all
  end

  def create
    new_article = Article.create(person_params)
    if new_article.save
      render json: new_article, notice: 'Create new Article'
    else
      render json: new_article, notice: 'Failed to create new Article'
    end
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def edit; end

  def update
    article = Article.find(params[:id])
    article[:title] = params[:title]
    article[:body] = params[:body]

    if article.save
      render json: article, notice: 'Changes are successful'
    else
      render json: article, notice: 'Failed to changes'
    end
  end

  def destroy
    article = Article.find(params[:id]).destroy
    if article.delete
      render json: article, notice: 'Delete succesful'
    else
      render json: article, notice: 'Delete unsuccessful'
    end
  end

  # private
  # Don't work
  # def person_params
  #   params.require(:article).permit(:title, :body)
  # end

end
