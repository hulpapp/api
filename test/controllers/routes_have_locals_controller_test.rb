require "test_helper"

class RoutesHaveLocalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @routes_have_local = routes_have_locals(:one)
  end

  test "should get index" do
    get routes_have_locals_url, as: :json
    assert_response :success
  end

  test "should create routes_have_local" do
    assert_difference('RoutesHaveLocal.count') do
      post routes_have_locals_url, params: { routes_have_local: { local_id: @routes_have_local.local_id, route_id: @routes_have_local.route_id } }, as: :json
    end

    assert_response 201
  end

  test "should show routes_have_local" do
    get routes_have_local_url(@routes_have_local), as: :json
    assert_response :success
  end

  test "should update routes_have_local" do
    patch routes_have_local_url(@routes_have_local), params: { routes_have_local: { local_id: @routes_have_local.local_id, route_id: @routes_have_local.route_id } }, as: :json
    assert_response 200
  end

  test "should destroy routes_have_local" do
    assert_difference('RoutesHaveLocal.count', -1) do
      delete routes_have_local_url(@routes_have_local), as: :json
    end

    assert_response 204
  end
end
