class Show
  attr_accessor :seats

  def initialize(seats)
    @seats = seats
    @seats.each do |seat|
      seat.show = self
    end
  end
end
