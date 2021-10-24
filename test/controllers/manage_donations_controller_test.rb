require "test_helper"

class ManageDonationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manage_donation = manage_donations(:one)
  end

  test "should get index" do
    get manage_donations_url, as: :json
    assert_response :success
  end

  test "should create manage_donation" do
    assert_difference('ManageDonation.count') do
      post manage_donations_url, params: { manage_donation: { donation_id: @manage_donation.donation_id, event_id: @manage_donation.event_id } }, as: :json
    end

    assert_response 201
  end

  test "should show manage_donation" do
    get manage_donation_url(@manage_donation), as: :json
    assert_response :success
  end

  test "should update manage_donation" do
    patch manage_donation_url(@manage_donation), params: { manage_donation: { donation_id: @manage_donation.donation_id, event_id: @manage_donation.event_id } }, as: :json
    assert_response 200
  end

  test "should destroy manage_donation" do
    assert_difference('ManageDonation.count', -1) do
      delete manage_donation_url(@manage_donation), as: :json
    end

    assert_response 204
  end
end
