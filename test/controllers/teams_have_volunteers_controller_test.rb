require "test_helper"

class TeamsHaveVolunteersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teams_have_volunteer = teams_have_volunteers(:one)
  end

  test "should get index" do
    get teams_have_volunteers_url, as: :json
    assert_response :success
  end

  test "should create teams_have_volunteer" do
    assert_difference('TeamsHaveVolunteer.count') do
      post teams_have_volunteers_url, params: { teams_have_volunteer: { team_id: @teams_have_volunteer.team_id, volunteer_id: @teams_have_volunteer.volunteer_id } }, as: :json
    end

    assert_response 201
  end

  test "should show teams_have_volunteer" do
    get teams_have_volunteer_url(@teams_have_volunteer), as: :json
    assert_response :success
  end

  test "should update teams_have_volunteer" do
    patch teams_have_volunteer_url(@teams_have_volunteer), params: { teams_have_volunteer: { team_id: @teams_have_volunteer.team_id, volunteer_id: @teams_have_volunteer.volunteer_id } }, as: :json
    assert_response 200
  end

  test "should destroy teams_have_volunteer" do
    assert_difference('TeamsHaveVolunteer.count', -1) do
      delete teams_have_volunteer_url(@teams_have_volunteer), as: :json
    end

    assert_response 204
  end
end
