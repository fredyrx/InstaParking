class ParkingLotsController < ApplicationController
  before_action :validate_user , except: [:search, :show, :new, :by_district] #:validate_user, only: [:create] #
   
    def show
        @ofertar_class = 'active'
        @parking = ParkingLot.find(params[:id])
    end
    
    def index
        @ofertar_class = 'active'
        unless current_user.name == 'admin' or current_user.name == 'administrador'
            @parkings = current_user.parking_lots.all
        else
            @parkings = ParkingLot.all
        end
        
    end
    
    def new
        @ofertar_class = 'active'
        @o_class = "active"
        @parking = ParkingLot.new
        @districts = District.all
    end
     
    def create
        @ofertar_class = 'active'
        @parking = current_user.parking_lots.new(parking_params)
        #@parking.user_id = current_user.id
        if @parking.save
            redirect_to @parking
        else
            render :new
        end
    end
         
    def search
        @buscar_class = 'active'
        @districts = District.all
        if params[:district_id]
            @default = params[:district_id].to_i
        end
    end
    
    def result
        @buscar_class = 'active'
        @parkings = ParkingLot.search(params[:district_id],params[:date],params[:start_time],params[:end_time],params[:cameras],params[:persons],params[:alarms])
        @minutes = (Time.parse(params[:end_time]) - Time.parse(params[:start_time]))/60.0
        @date = params[:date]
        @start_time = params[:start_time]
        @end_time = params[:end_time]
    end

    def rents
        @parking = ParkingLot.find(params[:id])
    end
    
    def sales
        @parkings = current_user.parking_lots.all
    end

    def by_district
        desc = params[:description]
        codigo = 0 
        if desc
            d = District.where("description like ?","%#{desc}%")
            if d.first
                codigo = d.first.id 
                redirect_to "/parking_lots/search?district_id=#{codigo}"
            else
                redirect_to "/parking_lots/search", notice: 'Lo lamentamos :( No Encontramos estacionamiento en el distrito que buscas.'
            end
        end
        
        
    end

    
    private
    
    def validate_user
        unless user_signed_in?
            redirect_to new_user_session_path, notice: 'Debes iniciar sesion antes de realizar la opración.'
        end    
    end
    

    
    def parking_params
        params.require(:parking_lot).permit(:name,:description,:district_id,:price,:spaces,:opening_time,:closing_time,:photo,:has_security_cameras,:has_security_alarms,:has_security_persons,:has_supermarkets_close,:has_restaurants_close,:has_cinemas_close)
    end
    
end
