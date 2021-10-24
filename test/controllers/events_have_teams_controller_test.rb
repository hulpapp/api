require "test_helper"

class EventsHaveTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @events_have_team = events_have_teams(:one)
  end

  test "should get index" do
    get events_have_teams_url, as: :json
    assert_response :success
  end

  test "should create events_have_team" do
    assert_difference('EventsHaveTeam.count') do
      post events_have_teams_url, params: { events_have_team: { event_id: @events_have_team.event_id, team_id: @events_have_team.team_id } }, as: :json
    end

    assert_response 201
  end

  test "should show events_have_team" do
    get events_have_team_url(@events_have_team), as: :json
    assert_response :success
  end

  test "should update events_have_team" do
    patch events_have_team_url(@events_have_team), params: { events_have_team: { event_id: @events_have_team.event_id, team_id: @events_have_team.team_id } }, as: :json
    assert_response 200
  end

  test "should destroy events_have_team" do
    assert_difference('EventsHaveTeam.count', -1) do
      delete events_have_team_url(@events_have_team), as: :json
    end

    assert_response 204
  end
end
