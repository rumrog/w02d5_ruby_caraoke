class Room

  attr_reader :name, :guests, :capacity, :playlist, :till, :fee

  def initialize(name, guests, capacity, playlist, till, fee)
    @name = name
    @guests = guests
    @capacity = capacity
    @playlist = playlist
    @till = till
    @fee = fee
  end

  def room_has_guests(guest)
    return @guests.include?(guest)
  end

end
