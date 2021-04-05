require "test_helper"

class TimeSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_schedule = time_schedules(:one)
  end

  test "should get index" do
    get time_schedules_url, as: :json
    assert_response :success
  end

  test "should create time_schedule" do
    assert_difference('TimeSchedule.count') do
      post time_schedules_url, params: { time_schedule: { description: @time_schedule.description, distribution_center_id: @time_schedule.distribution_center_id, title: @time_schedule.title } }, as: :json
    end

    assert_response 201
  end

  test "should show time_schedule" do
    get time_schedule_url(@time_schedule), as: :json
    assert_response :success
  end

  test "should update time_schedule" do
    patch time_schedule_url(@time_schedule), params: { time_schedule: { description: @time_schedule.description, distribution_center_id: @time_schedule.distribution_center_id, title: @time_schedule.title } }, as: :json
    assert_response 200
  end

  test "should destroy time_schedule" do
    assert_difference('TimeSchedule.count', -1) do
      delete time_schedule_url(@time_schedule), as: :json
    end

    assert_response 204
  end
end
