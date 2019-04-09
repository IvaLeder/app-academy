require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each{ |key, val| @rooms[key] = Room.new(val) }
  end

  def room_exists?(room)
    @rooms.has_key?(room)
  end

  def name
    @name.split(' ').map(&:capitalize).join(' ')
  end

  def rooms
    @rooms
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
      response = @rooms[room_name].add_occupant(person)
      if response
        puts 'check in successful'
      else
        puts 'sorry, room is full'
        return false
      end
    else
      puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| room.available_space > 0 }
  end

  def list_rooms
    @rooms.each { |k, v| puts "#{k}. #{v.available_space}" }
  end
end

hotel = Hotel.new("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1)
      hotel.check_in("Jesse", "Basement")
      hotel.check_in("Walter", "Basement")
      hotel.check_in("Gus", "Basement")
      hotel.check_in("Hank", "Basement")
      hotel.check_in("Rick", "Attic")
      hotel.check_in("Morty", "Attic")
      hotel.check_in("Harry", "Under the Stairs")

hotel.list_rooms
