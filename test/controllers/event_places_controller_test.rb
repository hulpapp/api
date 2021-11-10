require "test_helper"

class EventPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_place = event_places(:one)
  end

  test "should get index" do
    get event_places_url, as: :json
    assert_response :success
  end

  test "should create event_place" do
    assert_difference('EventPlace.count') do
      post event_places_url, params: { event_place: { address: @event_place.address, event_id: @event_place.event_id, lat: @event_place.lat, long: @event_place.long, name: @event_place.name, placeid: @event_place.placeid } }, as: :json
    end

    assert_response 201
  end

  test "should show event_place" do
    get event_place_url(@event_place), as: :json
    assert_response :success
  end

  test "should update event_place" do
    patch event_place_url(@event_place), params: { event_place: { address: @event_place.address, event_id: @event_place.event_id, lat: @event_place.lat, long: @event_place.long, name: @event_place.name, placeid: @event_place.placeid } }, as: :json
    assert_response 200
  end

  test "should destroy event_place" do
    assert_difference('EventPlace.count', -1) do
      delete event_place_url(@event_place), as: :json
    end

    assert_response 204
  end
end
