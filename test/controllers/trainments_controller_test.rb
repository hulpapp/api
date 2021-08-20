require "test_helper"

class TrainmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainment = trainments(:one)
  end

  test "should get index" do
    get trainments_url, as: :json
    assert_response :success
  end

  test "should create trainment" do
    assert_difference('Trainment.count') do
      post trainments_url, params: { trainment: { address: @trainment.address, description: @trainment.description, name: @trainment.name } }, as: :json
    end

    assert_response 201
  end

  test "should show trainment" do
    get trainment_url(@trainment), as: :json
    assert_response :success
  end

  test "should update trainment" do
    patch trainment_url(@trainment), params: { trainment: { address: @trainment.address, description: @trainment.description, name: @trainment.name } }, as: :json
    assert_response 200
  end

  test "should destroy trainment" do
    assert_difference('Trainment.count', -1) do
      delete trainment_url(@trainment), as: :json
    end

    assert_response 204
  end
end
