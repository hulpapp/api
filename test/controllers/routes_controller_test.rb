require "test_helper"

class RoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route = routes(:one)
  end

  test "should get index" do
    get routes_url, as: :json
    assert_response :success
  end

  test "should create route" do
    assert_difference('Route.count') do
      post routes_url, params: { route: { name: @route.name } }, as: :json
    end

    assert_response 201
  end

  test "should show route" do
    get route_url(@route), as: :json
    assert_response :success
  end

  test "should update route" do
    patch route_url(@route), params: { route: { name: @route.name } }, as: :json
    assert_response 200
  end

  test "should destroy route" do
    assert_difference('Route.count', -1) do
      delete route_url(@route), as: :json
    end

    assert_response 204
  end
end
