require 'test_helper'

class CarTest < ActiveSupport::TestCase
	def setup
		@car = Car.new(type: "example_type", color: "example_color", price: "simbolicna")
	end
end
