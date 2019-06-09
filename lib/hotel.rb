require_relative "room"

class Hotel
  
     def initialize(hotel_name, capacities)

        @name = hotel_name
        @rooms = {}
       
        capacities.each do |room_name , capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
         @name.split.map(&:capitalize).join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(name, room_name)

        if room_exists?(room_name) 
            if @rooms[room_name].add_occupant(name) 
                puts 'check in successful'
            else
                puts 'sorry room is full'
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each do |room, capacities|
            return true if !@rooms[room].full?
        end
        return false
    end
    
    def list_rooms
        @rooms.each do |room, capacities|
            puts "#{room} : #{@rooms[room].available_space}"
        end
    end
end
