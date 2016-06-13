class DistrictsController < ApplicationController
    def index
        @admin_class = "active"
        @districts = District.all
    end
    
    def show
        @admin_class = "active"
        @district = District.find(params[:id])
    end
    
    def new
        @admin_class = "active"
        @district = District.new 
    end
    
    def create
        @admin_class = "active"
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
