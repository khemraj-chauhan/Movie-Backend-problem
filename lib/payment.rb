class Payment
  attr_accessor :bookable

  def initialize(bookable)
    @bookable = bookable
  end

  def seat_booking(audi)
    subtotal = calculate_subtotal_and_update_seat_status
    service_tax = (subtotal * 0.14).to_d
    swachh_bharat_cess = (subtotal * 0.005).to_d
    krishi_kalyan_cess = (subtotal * 0.005).to_d
    create_sale(subtotal, service_tax, swachh_bharat_cess, krishi_kalyan_cess)
    total = (subtotal + service_tax + swachh_bharat_cess + krishi_kalyan_cess).to_d
    puts "Successfully Booked - Show #{audi}"
    puts "Subtotal: Rs. #{subtotal}"
    puts "Service Tax @14%: Rs. #{service_tax}"
    puts "Swachh Bharat Cess @0.5%: Rs. #{swachh_bharat_cess}"
    puts "Krishi Kalyan Cess @0.5%: Rs. #{krishi_kalyan_cess}"
    puts "Total: Rs. #{total}\n\n"
  end

  private

  def calculate_subtotal_and_update_seat_status
    subtotal = 0
    bookable.each do |seat|
      seat.status = 'sold'
      category = seat.category
      subtotal += category.price
    end
    subtotal
  end

  def create_sale(subtotal, service_tax, swachh_bharat_cess, krishi_kalyan_cess)
    Sale.new(
      revenue: subtotal,
      service_tax: service_tax,
      swachh_bharat_cess: swachh_bharat_cess,
      krishi_kalyan_cess: krishi_kalyan_cess
    )
  end
end