require "test_helper"

class OrganizersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organizer = organizers(:one)
  end

  test "should get index" do
    get organizers_url, as: :json
    assert_response :success
  end

  test "should create organizer" do
    assert_difference('Organizer.count') do
      post organizers_url, params: { organizer: { volunteer_id: @organizer.volunteer_id } }, as: :json
    end

    assert_response 201
  end

  test "should show organizer" do
    get organizer_url(@organizer), as: :json
    assert_response :success
  end

  test "should update organizer" do
    patch organizer_url(@organizer), params: { organizer: { volunteer_id: @organizer.volunteer_id } }, as: :json
    assert_response 200
  end

  test "should destroy organizer" do
    assert_difference('Organizer.count', -1) do
      delete organizer_url(@organizer), as: :json
    end

    assert_response 204
  end
end
