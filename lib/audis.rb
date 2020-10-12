class Audis
  attr_accessor :platinum_category, :gold_category, :silver_category

  def initialize
    @platinum_category = Category.new({type: 'platinum', price: 320})
    @gold_category = Category.new({type: 'gold', price: 280})
    @silver_category = Category.new({type: 'silver', price: 240})
  end

  def one
    Show.new(
      [
        Seat.new({seat_number: 'A1', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A2', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A3', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A4', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A5', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A6', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A7', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A8', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A9', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'B1', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B2', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B3', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B4', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B5', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B6', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B7', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'B8', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'B9', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'C1', status: 'sold', category: silver_category}),
        Seat.new({seat_number: 'C2', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C3', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C4', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C5', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C6', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C7', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C8', status: 'sold', category: silver_category}),
        Seat.new({seat_number: 'C9', status: 'sold', category: silver_category}),
      ]
    )
  end

  def two
    Show.new(
      [
        Seat.new({seat_number: 'A1', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A2', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A3', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A4', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A5', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A6', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A7', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A8', status: 'sold', category: platinum_category}),
        Seat.new({seat_number: 'A9', status: 'sold', category: platinum_category}),
        Seat.new({seat_number: 'B1', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'B2', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B3', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B4', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B5', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B6', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'B7', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'B8', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'B9', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'C1', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C2', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C3', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C4', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C5', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C6', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C7', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C8', status: 'sold', category: silver_category}),
        Seat.new({seat_number: 'C9', status: 'sold', category: silver_category}),
      ]
    )
  end

  def three
    Show.new(
      [
        Seat.new({seat_number: 'A1', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A2', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A3', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A4', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A5', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A6', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A7', status: 'available', category: platinum_category}),
        Seat.new({seat_number: 'A8', status: 'sold', category: platinum_category}),
        Seat.new({seat_number: 'A9', status: 'sold', category: platinum_category}),
        Seat.new({seat_number: 'B1', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B2', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B3', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B4', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B5', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B6', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B7', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B8', status: 'available', category: gold_category}),
        Seat.new({seat_number: 'B9', status: 'sold', category: gold_category}),
        Seat.new({seat_number: 'C1', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C2', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C3', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C4', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C5', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C6', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C7', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C8', status: 'available', category: silver_category}),
        Seat.new({seat_number: 'C9', status: 'available', category: silver_category}),
      ]
    )
  end
end
