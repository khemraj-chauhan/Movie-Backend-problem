class Seat
  attr_accessor :seat_number, :status
  attr_accessor :show, :category

  def initialize(seat_number:, status:, category:)
    @seat_number = seat_number
    @status = status
    self.category = category
  end
end
