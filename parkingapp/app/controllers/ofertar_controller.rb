class OfertarController < ApplicationController
    def index
         @ofertar_class = 'active'
         if params[:ofertar] then 
             flash[:mensaje] = "#{session[:usuario]}, tu estacionamiento será dado de alta en breve."
             redirect_to "/buscar"
         end
    end
end
