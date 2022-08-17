class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(updated_at: :desc)
  end

  def show
    @article = Article.find(id)
  end

  def edit
    @article = Article.find(id)
  end

  def update
    Article.find(id).update!(**article_attributes)
    redirect_to(article_path(id))
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create!(**article_attributes)
    redirect_to(articles_path)
  end

  def destroy
    @article = Article.find(id).destroy!
    redirect_to(articles_path)
  end

  private

  def id
    params.require("id")
  end

  def article_attributes
    params.require("article").permit(:text)
  end
end
