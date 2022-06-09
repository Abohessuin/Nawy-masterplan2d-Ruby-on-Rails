require "test_helper"

class Masterplan2dsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @masterplan2d = masterplan2ds(:one)
  end

  test "should get index" do
    get masterplan2ds_url
    assert_response :success
  end

  test "should get new" do
    get new_masterplan2d_url
    assert_response :success
  end

  test "should create masterplan2d" do
    assert_difference("Masterplan2d.count") do
      post masterplan2ds_url, params: { masterplan2d: {  } }
    end

    assert_redirected_to masterplan2d_url(Masterplan2d.last)
  end

  test "should show masterplan2d" do
    get masterplan2d_url(@masterplan2d)
    assert_response :success
  end

  test "should get edit" do
    get edit_masterplan2d_url(@masterplan2d)
    assert_response :success
  end

  test "should update masterplan2d" do
    patch masterplan2d_url(@masterplan2d), params: { masterplan2d: {  } }
    assert_redirected_to masterplan2d_url(@masterplan2d)
  end

  test "should destroy masterplan2d" do
    assert_difference("Masterplan2d.count", -1) do
      delete masterplan2d_url(@masterplan2d)
    end

    assert_redirected_to masterplan2ds_url
  end
end
