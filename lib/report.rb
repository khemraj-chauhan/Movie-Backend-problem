class Report
  def self.summery
    report = Sale.total_sales_details
    puts 'Total Sales:'
    puts "Revenue: Rs. #{report[:revenue]}"
    puts "Service Tax: Rs. #{report[:service_tax]}"
    puts "Swachh Bharat Cess: Rs. #{report[:swachh_bharat_cess]}"
    puts "Krishi Kalyan Cess: Rs. #{report[:krishi_kalyan_cess]}\n\n"
  end
end