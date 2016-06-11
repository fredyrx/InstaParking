class ParkingLotsController < ApplicationController
  before_action :validate_user , except: [:search, :show, :new] #:validate_user, only: [:create] #
   
    def show
        @parking = ParkingLot.find(params[:id])
    end
    
    def index
        @parkings = current_user.parking_lots.all
    end
    
    def new
        @parking = ParkingLot.new
        @districts = District.all
    end
     
    def create
        @parking = current_user.parking_lots.new(parking_params)
        #@parking.user_id = current_user.id
        if @parking.save
            redirect_to @parking
        else
            render :new
        end
    end
         
    def search
        @districts = District.all
        if params[:district_id]
            @default = params[:district_id].to_i
        end
    end
    
    def result
        @parkings = ParkingLot.search(params[:district_id],params[:date],params[:start_time],params[:end_time],params[:cameras],params[:persons],params[:alarms])
        @minutes = (Time.parse(params[:end_time]) - Time.parse(params[:start_time]))/60.0
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
