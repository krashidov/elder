require 'test_helper'

class CareplansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @careplan = careplans(:one)
  end

  test "should get index" do
    get careplans_url
    assert_response :success
  end

  test "should get new" do
    get new_careplan_url
    assert_response :success
  end

  test "should create careplan" do
    assert_difference('Careplan.count') do
      post careplans_url, params: { careplan: {  } }
    end

    assert_redirected_to careplan_url(Careplan.last)
  end

  test "should show careplan" do
    get careplan_url(@careplan)
    assert_response :success
  end

  test "should get edit" do
    get edit_careplan_url(@careplan)
    assert_response :success
  end

  test "should update careplan" do
    patch careplan_url(@careplan), params: { careplan: {  } }
    assert_redirected_to careplan_url(@careplan)
  end

  test "should destroy careplan" do
    assert_difference('Careplan.count', -1) do
      delete careplan_url(@careplan)
    end

    assert_redirected_to careplans_url
  end
end
