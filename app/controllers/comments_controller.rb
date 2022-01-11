# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_article

  def create
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status)
  end

  def find_article
    @article = Article.find(params[:article_id])
  end
end
