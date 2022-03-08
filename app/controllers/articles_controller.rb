class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def show
    # esto es igual a que en la consola ponga article = Article.find(3) por poner un ejemplo, pero no estara
    # disponible en mi vista show.html.erb , para ello se pone el @, para convertir mi variable normal en una 
    # variable de instancia
    
  end

  def index
    @articles = Article.all 
  end

  def new
    @article = Article.new  
  end

  def edit
    # edit y update confunden algo, pero edit es de tipo get, por lo que es una vista, aqui solo renderizamos
    # segun el id que de el params, y update es tipo PUT,asi que una vez modificado un article,debe hacer render
    
  end
  

  def create
    # este comando renderiza en el navegador lo que cremos, pero mejor lo guardamos en una var pa la BD
    #render plain: params[:article]
    # @article = Article.new(params[:article]) tampoco es asi
    @article = Article.new(article_params)
    #render plain: @article.inspect aqui ya se ve como cuando en la consola creamos un articulo, con los demas fils vacios
    #@article.save

    # una vez hecho te debe redirigir al show action para mostrar el articulo que acabas de crear
    # nos vamos a routes --expanded y vemos que el prefix de show es article, entonces ese es mi path article_path
    #como la ruta es /articles/:id , levamos a pasar entre parentesis la instancia article y rails solito la va a extraer

    # redirect_to article_path(@article) esto se puede simplificar asi
    #redirect_to @article

    if @article.save
      flash[:notice] = "El articulo fue creado correctamente"
      redirect_to @article
    else
      render 'new'
    end


  end

  def update
    
    if @article.update(article_params)
      flash[:notice] = "El articulo fue actualizado correctamente"
      redirect_to @article
    else
      render 'edit'
    end
   
  end
  
  def destroy
    
    @article.destroy
    redirect_to articles_path
  end
  
  private

  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end