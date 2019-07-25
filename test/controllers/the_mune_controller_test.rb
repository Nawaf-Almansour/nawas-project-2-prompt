require 'test_helper'

class TheMuneControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get the_mune_home_url
    assert_response :success
  end

  test "should get books" do
    get the_mune_books_url
    assert_response :success
  end

  test "should get about" do
    get the_mune_about_url
    assert_response :success
  end

  test "should get contact" do
    get the_mune_contact_url
    assert_response :success
  end

end
