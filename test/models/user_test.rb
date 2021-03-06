require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "example user", email: "example_email@email.com",
						password: "foobar", password_confirmation: "foobar")
	end

	test "should be valid" do
		assert @user.valid?		
	end

	test "name should be present" do
		@user.name = "    "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = "   "
		assert_not @user.valid?
	end

	test "name should not be too long" do
		@user.name = "a" * 21
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "a" * 100 + "@email.com"
		assert_not @user.valid?
	end

	test "email validations should accept valid addresses" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
		valid_addresses.each do |valid_address|
			@user.email = valid_address
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end
	end

	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[user@example,com user_at_foo.com user.name@example. 
								foo@bar_baz.com foo@bar+baz.com]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be valid"
		end
	end

	test "password should have minimum length" do
		@user.password = @user.password_confirmation = "a" * 5
		assert_not @user.valid?
	end
end
