class Seat
  attr_accessor :seat_number, :status
  attr_accessor :show, :category

  def initialize(attributes = {})
    attributes.each do |name, value|
      value.seat = self  if name.eql?(:category)
      send("#{name}=", value)
    end
  end
end