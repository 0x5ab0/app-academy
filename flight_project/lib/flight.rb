class Flight
    attr_reader :passengers
    
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        if !self.full?
            @passengers << passenger if passenger.has_flight?(@flight_number)
        end
    end

    def list_passengers
        @passengers.collect { |passenger| passenger.name }
    end

    def [](i)
        @passengers[i]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end