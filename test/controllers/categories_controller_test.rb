require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

	def setup
      @category=Category.create(name: "sports")
      @user = User.create(username: "divya", email: "divya333@gmail.com", password: "divya123", admin: true)

	end


	test "should get category index" do
		get categories_path
		assert_response :success
	end

	test "should get new" do
		sign_in_as(@user,"divya123")
		get new_category_path
		assert_response :success

	end

	test "should get show" do 
		get category_path(@category)
		assert_response :success

	end

	test "should redirect if admin is not logged in" do
		assert_no_difference 'Category.count' do
			post categories_path,params:{category:{name: "sports"} }
		end
		assert_redirected_to categories_path


	end



end