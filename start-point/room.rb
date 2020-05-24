class Room

  attr_reader :name, :capacity, :playlist, :till, :fee

  def initialize(name, capacity, playlist, till, fee)
    @name = name
    @capacity = capacity
    @playlist = playlist
    @till = till
    @fee = fee
  end

end


