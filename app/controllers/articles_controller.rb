class ArticlesController < ApplicationController
  def show
    # esto es igual a que en la consola ponga article = Article.find(3) por poner un ejemplo, pero no estara
    # disponible en mi vista show.html.erb , para ello se pone el @, para convertir mi variable normal en una 
    # variable de instancia
    @article = Article.find(params[:id])
  end
end