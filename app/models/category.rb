class Category
  attr_accessor :seat
  attr_accessor :type, :price

  def initialize(attributes)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end