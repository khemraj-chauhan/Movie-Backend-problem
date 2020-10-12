class Category
  attr_accessor :seat
  attr_accessor :type, :price

  def initialize(type:, price:)
    @type = type
    @price = price
  end
end
