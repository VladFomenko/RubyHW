class Api::V1::ArticlesController < ApplicationController
  def index
    Article.all

    render redirect_to index
  end

  def create
    new_article = Article.create(person_params)
    if new_article.save
      render redirect_to show, notice: 'Create new Article'
    else
      render redirect_to create, notice: 'Failed to create new Article'
    end
  end

  def show
    Article.find(params[:id])

    render redirect_to show
  end

  def edit
    article = Article.find(params[:id])
    article[:title] = person_params[:title]
    article[:body] = person_params[:body]

    if article.save
      render redirect_to show, notice: 'Changes are successful'
    else
      render redirect_to edit, notice: 'Failed to changes'
    end
  end

  def update; end

  def destroy
    article = Article.find(params[:id]).destroy
    article.delete

    render redirect_to index, notice: 'Delete succesful'
  end

  private

  def person_params
    params.require(:article).permit(:title, :body)
  end

end
