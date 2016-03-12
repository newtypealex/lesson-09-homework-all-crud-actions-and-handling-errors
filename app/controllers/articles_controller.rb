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
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "SUCCESSFULLY CREATED #{@article.title}"
      redirect_to articles_path
    else
      flash.now[:error] = "AN ERROR OCCURRED WHILE SAVING"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "SUCCESSFULLY SAVED #{@article.title}"
    else
      flash.now[:error] = "AN ERROR OCCURRED WHILE SAVING"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, notice: "DELETED #{@article.title}"
  end

  private
 
    def article_params         
      params.require(:article).permit(:title, :body)   
    end

end
