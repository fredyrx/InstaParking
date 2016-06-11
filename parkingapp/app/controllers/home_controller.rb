class HomeController < ApplicationController
  def index
    @home_class = 'active'
    @districts = District.all
  end
  
  def faq
     @faq_class = 'active'
  end
  
  def contacto
    @contacto_class = 'active'
  end
  
  def quienessomos
    @quienessomos_class = 'active'
  end  
end
