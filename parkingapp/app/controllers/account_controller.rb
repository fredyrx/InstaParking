class AccountController < ApplicationController
  def login
    @login_class = 'active'
    if params[:usuario] then
      session[:usuario] = params[:usuario]
      flash[:mensaje] = "Bienvenido #{session[:usuario]}"
      redirect_to "/buscar"
    end
  end
  
  def signup
    if params[:username] then
      session[:usuario] = params[:username]
      flash[:mensaje] = "#{session[:usuario]}, gracias por confiar en nosotros. :)"
      redirect_to "/buscar"
    end
  end
  
  def logout
    session.delete :usuario
    redirect_to "/"
  end
end
