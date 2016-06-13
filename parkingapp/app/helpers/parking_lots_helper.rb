module ParkingLotsHelper
    def calcular_ganancia_total(id)
        ganancia = 0.0
        rents_of_parking = ParkingLot.find(id).rents.all
        rents_of_parking.each do |r|
            ganancia += r.total_price
        end
        return ganancia
    end
end
