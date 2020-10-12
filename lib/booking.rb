require 'audis'

class Booking
  attr_accessor :show_one, :show_two, :show_three

  def initialize(show_one, show_two, show_three)
    @show_one = show_one
    @show_two = show_two
    @show_three = show_three
  end
  
  def display_show_details
    puts 'Seating arrangement:'
    (1..3).each do |audi|
      puts "Show #{audi} Running in Audi #{audi}:\nAll Seats:"
      show = selected_show(audi)
      seat_categorization(show)
      puts
    end
  end

  def seat_categorization(show)
    show.seats.in_groups_of(9) do |seats|
      seats.each do |seat|
        seat_number = seat.status.eql?('available') ? seat.seat_number : " "
        print "#{seat_number} "
      end
      puts
    end
  end

  def selected_show(audi)
    return show_one if audi.eql?(1)
    audi.eql?(2) ? show_two : show_three
  end

  def select_audi_and_seat
    puts 'Input:'
    print 'Enter Show no: '
    audi = run_until_input_audi_valid
    print 'Enter seats: '
    selected_seats = gets.chomp
    seat_availabilty(selected_seats, audi)
  end

  def run_until_input_audi_valid
    audi = nil
    while([1, 2, 3].exclude?(audi.to_i))
      audi = gets.chomp
      puts 'Please select valid audi number 1, 2, or 3' if [1, 2, 3].exclude?(audi.to_i)
    end
    audi
  end

  def seat_availabilty(selected_seats, audi)
    input_seats = selected_seats.split(",").map(&:strip)
    available_and_bookable = find_all_available_and_bookable_seats(input_seats, audi)
    sold_out_seats = input_seats - available_and_bookable[:available_seats].map(&:seat_number)
    if sold_out_seats.present?
      puts "#{sold_out_seats.join(', ')} Not available, Please select different seats\n\n"
      return
    end
    seat_booking(available_and_bookable[:bookable_seat], audi)
  end

  def find_all_available_and_bookable_seats(input_seats, audi)
    available_seats = []
    bookable_seat = []
    show = selected_show(audi.to_i)
    show.seats.each do |seat|
      next if seat.status.eql?('sold') 
      available_seats << seat
      bookable_seat << seat if input_seats.include?(seat.seat_number)
    end
    {bookable_seat: bookable_seat, available_seats: available_seats}
  end

  def seat_booking(bookable_seat, audi)
    subtotal = calculate_subtotal_and_update_seat_status(bookable_seat)
    service_tax = (subtotal * 0.14).to_d
    swachh_bharat_cess = (subtotal * 0.005).to_d
    krishi_kalyan_cess = (subtotal * 0.005).to_d
    Sale.create(
      {
        revenue: subtotal,
        service_tax: service_tax,
        swachh_bharat_cess: swachh_bharat_cess,
        krishi_kalyan_cess: krishi_kalyan_cess
      }
    )
    total = (subtotal + service_tax + swachh_bharat_cess + krishi_kalyan_cess).to_d
    puts "Successfully Booked - Show #{audi}"
    puts "Subtotal: Rs. #{subtotal}"
    puts "Service Tax @14%: Rs. #{service_tax}"
    puts "Swachh Bharat Cess @0.5%: Rs. #{swachh_bharat_cess}"
    puts "Krishi Kalyan Cess @0.5%: Rs. #{krishi_kalyan_cess}"
    puts "Total: Rs. #{total}\n\n"
  end

  def calculate_subtotal_and_update_seat_status(bookable_seat)
    subtotal = 0
    bookable_seat.each do |seat|
      seat.status = 'sold'
      category = seat.category
      subtotal += category.price
    end
    subtotal
  end

  def sales_report
    report = Sale.total_sales_details
    puts 'Total Sales:'
    puts "Revenue: Rs. #{report[:revenue]}"
    puts "Service Tax: Rs. #{report[:service_tax]}"
    puts "Swachh Bharat Cess: Rs. #{report[:swachh_bharat_cess]}"
    puts "Krishi Kalyan Cess: Rs. #{report[:krishi_kalyan_cess]}\n\n"
  end
end

audis = Audis.new
show_one = audis.one
show_two = audis.two
show_three = audis.three
booking = Booking.new(show_one, show_two, show_three)
booking.display_show_details
booking.select_audi_and_seat
booking.select_audi_and_seat
booking.select_audi_and_seat
booking.sales_report


# TO RUN this from termial use the command - rails r 'lib/booking.rb'