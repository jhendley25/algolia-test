require 'test_helper'

class MobileAppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mobile_app = mobile_apps(:one)
  end


  test "should create mobile_app" do
    assert_difference('MobileApp.count') do
      post "/api/1/apps", params: { mobile_app: { category: @mobile_app.category, image: @mobile_app.image, link: @mobile_app.link, name: @mobile_app.name, price: @mobile_app.price, rating: @mobile_app.rating, rating_count: @mobile_app.rating_count } }
    end

    # assert_redirected_to app_url(App.last)
  end



  # test "should destroy app" do
  #   assert_difference('App.count', -1) do
  #     delete app_url(@mobile_app)
  #   end
  #
  #   assert_redirected_to apps_url
  # end
end
