require "test_helper"

class EventsHaveLocalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @events_have_local = events_have_locals(:one)
  end

  test "should get index" do
    get events_have_locals_url, as: :json
    assert_response :success
  end

  test "should create events_have_local" do
    assert_difference('EventsHaveLocal.count') do
      post events_have_locals_url, params: { events_have_local: { event_id: @events_have_local.event_id, local_id: @events_have_local.local_id } }, as: :json
    end

    assert_response 201
  end

  test "should show events_have_local" do
    get events_have_local_url(@events_have_local), as: :json
    assert_response :success
  end

  test "should update events_have_local" do
    patch events_have_local_url(@events_have_local), params: { events_have_local: { event_id: @events_have_local.event_id, local_id: @events_have_local.local_id } }, as: :json
    assert_response 200
  end

  test "should destroy events_have_local" do
    assert_difference('EventsHaveLocal.count', -1) do
      delete events_have_local_url(@events_have_local), as: :json
    end

    assert_response 204
  end
end
