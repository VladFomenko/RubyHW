UNPUBLISHED = 0
PUBLISHED = 1

class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :set_author, only: %i[index create]
  before_action :set_article, only: %i[create]

  def index
    if [UNPUBLISHED, PUBLISHED].include?(person_params[:status])
      render json: @author.comments.where(status: person_params[:status])
    else
      render json: @author.comments
    end
  end

  def show
    begin
      render json: @comment
    rescue ActiveRecord::RecordNotFound => e
      render plain: 'Record not found'
    end
  end

  def create
    @comment = @author.comments.new(person_params)
    if @comment.valid?
      @comment.save
      render json: @comment
    else
      render plain: 'Failed to save'
    end
  end

  def update
    if [UNPUBLISHED, PUBLISHED].include?(person_params[:status])
      render plain: 'Update succesful' if @comment.update(status: person_params[:status])
    else
      render plain: 'Value status is not correct'
    end
  end

  def destroy
    render plain: 'Deletion successful' if @comment.destroy
  end

  private

  def set_article
    if person_params[:article_id].is_a?(Integer)
      begin
        @article = Article.find(person_params[:article_id])
      rescue ActiveRecord::RecordNotFound => e
        render plain: 'ActiveRecord::RecordNotFound'
      end
    else
      render plain: 'Record not found'
    end
  end

  def set_comment
    set_author
    begin
      @comment = @author.comments.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render plain: 'ActiveRecord::RecordNotFound'
    end
  end

  def set_author
    @author = Author.find(params[:author_id])
  end

  def person_params
    params.require(:authors).require(:comments).permit(:body, :status, :article_id)
  end
end
