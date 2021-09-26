require "test_helper"

class PresencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @presence = presences(:one)
  end

  test "should get index" do
    get presences_url, as: :json
    assert_response :success
  end

  test "should create presence" do
    assert_difference('Presence.count') do
      post presences_url, params: { presence: { date: @presence.date, endDate: @presence.endDate, startDate: @presence.startDate, volunteer_id: @presence.volunteer_id } }, as: :json
    end

    assert_response 201
  end

  test "should show presence" do
    get presence_url(@presence), as: :json
    assert_response :success
  end

  test "should update presence" do
    patch presence_url(@presence), params: { presence: { date: @presence.date, endDate: @presence.endDate, startDate: @presence.startDate, volunteer_id: @presence.volunteer_id } }, as: :json
    assert_response 200
  end

  test "should destroy presence" do
    assert_difference('Presence.count', -1) do
      delete presence_url(@presence), as: :json
    end

    assert_response 204
  end
end
