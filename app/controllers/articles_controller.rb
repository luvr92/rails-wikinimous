class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_parameters)
    redirect_to action: "index"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_parameters)
    redirect_to action: "index"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: "index"
  end

  private

  def article_parameters
    params.require(:article).permit(:title, :content)
  end

end
