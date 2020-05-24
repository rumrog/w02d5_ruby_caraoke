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

  def room_has_playlist(song)
    return @playlist.include?(song)
  end

  def guest_can_afford_fee(guest, room)
    return guest.wallet >= room.fee
  end

  def room_has_room(room)
    return room.guests().size() <= @capacity
  end
  
end
