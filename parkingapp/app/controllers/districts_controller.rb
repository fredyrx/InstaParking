class DistrictsController < ApplicationController
    def index
        @districts = District.all
    end
    
    def show
        @district = District.find(params[:id])
    end
    
    def new
        @district = District.new 
    end
    
    def create
        @district = District.new(district_params)
        if @district.save
            redirect_to @district
        else
            render :new
        end
    end
    
    private
    
    def district_params
        params.require(:district).permit(:description,:photo)
    end
end
