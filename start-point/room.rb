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

  def remove_guest_cash(guest, room)
    return guest.wallet - room.fee
  end

  def add_till_cash(room)
    return room.fee + room.till
  end

  def add_guest(guest)
    return @guests << guest
  end

  def add_song(song)
    return @playlist << song
  end

  def check_in(guest, room)
    if room_has_room(room) && guest_can_afford_fee(guest, room)
      remove_guest_cash(guest, room)
      add_till_cash(room)
      add_guest(guest)
    end
  end

end
