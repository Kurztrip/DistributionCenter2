require "test_helper"

class TimeWindowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_window = time_windows(:one)
  end

  test "should get index" do
    get time_windows_url, as: :json
    assert_response :success
  end

  test "should create time_window" do
    assert_difference('TimeWindow.count') do
      post time_windows_url, params: { time_window: { beginning: @time_window.beginning, ending: @time_window.ending, time_schedule_id: @time_window.time_schedule_id } }, as: :json
    end

    assert_response 201
  end

  test "should show time_window" do
    get time_window_url(@time_window), as: :json
    assert_response :success
  end

  test "should update time_window" do
    patch time_window_url(@time_window), params: { time_window: { beginning: @time_window.beginning, ending: @time_window.ending, time_schedule_id: @time_window.time_schedule_id } }, as: :json
    assert_response 200
  end

  test "should destroy time_window" do
    assert_difference('TimeWindow.count', -1) do
      delete time_window_url(@time_window), as: :json
    end

    assert_response 204
  end
end
