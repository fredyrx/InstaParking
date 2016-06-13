class RentsController < ApplicationController
    
    def new
        @rent = Rent.new(rent_params)
        @parking = ParkingLot.find(@rent.parking_lot_id)
        @rent.total_price = (@rent.total_minutes*(@parking.price/60.0)).round(2)
    end
    
    def index
        @rents = Rent.all
    end
    
    def show
        @ofertar_class = 'buscar_class'
        @rent = Rent.find(params[:id])        
    end
    
    def create
        @rent = current_user.rents.new(rent_params)
        #@parking.user_id = current_user.id
        if @rent.save
            redirect_to @rent , notice: 'Tu reserva se realizó correctamente.'
        else
            render :new
        end
    end
    
    def history
        @ofertar_class = 'buscar_class'
        @rents = current_user.rents.all
    end
    
    private
    def rent_params
        params.require(:rent).permit(:parking_lot_id,:total_minutes,:date,:start_time,:end_time,:total_price)
    end

end
