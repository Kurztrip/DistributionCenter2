require "test_helper"

class DistributionCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @distribution_center = distribution_centers(:one)
  end

  test "should get index" do
    get distribution_centers_url, as: :json
    assert_response :success
  end

  test "should create distribution_center" do
    assert_difference('DistributionCenter.count') do
      post distribution_centers_url, params: { distribution_center: { address: @distribution_center.address, available_space: @distribution_center.available_space, latitude_location: @distribution_center.latitude_location, longitude_location: @distribution_center.longitude_location, total_space: @distribution_center.total_space } }, as: :json
    end

    assert_response 201
  end

  test "should show distribution_center" do
    get distribution_center_url(@distribution_center), as: :json
    assert_response :success
  end

  test "should update distribution_center" do
    patch distribution_center_url(@distribution_center), params: { distribution_center: { address: @distribution_center.address, available_space: @distribution_center.available_space, latitude_location: @distribution_center.latitude_location, longitude_location: @distribution_center.longitude_location, total_space: @distribution_center.total_space } }, as: :json
    assert_response 200
  end

  test "should destroy distribution_center" do
    assert_difference('DistributionCenter.count', -1) do
      delete distribution_center_url(@distribution_center), as: :json
    end

    assert_response 204
  end
end
