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
    flash.now[:notice] = "New article created"
    @article = Article.create!(**article_attributes)
    streamables = "articles_count"

    attributes = {
      target: "articles_count",
      partial: "articles/count",
      locals: { count: (rand * 100).to_i }
    }

    Turbo::StreamsChannel.broadcast_update_to(streamables, **attributes)
  end

  def destroy
    flash.now[:alert] = "Article #{id} deleted"
    @article = Article.find(id).destroy!
  end

  private

  def random?
    params["random"].present?
  end

  def id
    params.require("id")
  end

  def article_attributes
    return { text: Faker::Company.bs.humanize } if random?
    params.require("article").permit(:text)
  end
end
