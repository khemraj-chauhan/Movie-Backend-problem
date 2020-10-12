class Sale
  attr_accessor :revenue, :service_tax, :swachh_bharat_cess, :krishi_kalyan_cess

  @@total_sales = []
  def initialize(revenue:, service_tax:, swachh_bharat_cess:, krishi_kalyan_cess:)
    @revenue = revenue
    @service_tax = service_tax
    @swachh_bharat_cess = swachh_bharat_cess
    @krishi_kalyan_cess = krishi_kalyan_cess
  end

  def self.create(attributes)
    @@total_sales << self.new(attributes)
  end

  def self.total_sales_details
    {
      revenue: @@total_sales.map(&:revenue).inject(0, &:+),
      service_tax: @@total_sales.map(&:service_tax).inject(0, &:+),
      swachh_bharat_cess: @@total_sales.map(&:swachh_bharat_cess).inject(0, &:+),
      krishi_kalyan_cess: @@total_sales.map(&:krishi_kalyan_cess).inject(0, &:+)
    }
  end
end
