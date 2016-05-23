class RentarController < ApplicationController
  def pagar
    if not session[:usuario] then
      flash[:mensaje] = "Debes iniciar sesion para poder pagar"
      redirect_to "/login"
    end
  end
  
  def pagado
  end
  
end
