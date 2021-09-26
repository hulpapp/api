require "test_helper"

class CertificatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @certificate = certificates(:one)
  end

  test "should get index" do
    get certificates_url, as: :json
    assert_response :success
  end

  test "should create certificate" do
    assert_difference('Certificate.count') do
      post certificates_url, params: { certificate: { date: @certificate.date, event_id: @certificate.event_id, organizer_id: @certificate.organizer_id, presence_id: @certificate.presence_id, volunteer_id: @certificate.volunteer_id } }, as: :json
    end

    assert_response 201
  end

  test "should show certificate" do
    get certificate_url(@certificate), as: :json
    assert_response :success
  end

  test "should update certificate" do
    patch certificate_url(@certificate), params: { certificate: { date: @certificate.date, event_id: @certificate.event_id, organizer_id: @certificate.organizer_id, presence_id: @certificate.presence_id, volunteer_id: @certificate.volunteer_id } }, as: :json
    assert_response 200
  end

  test "should destroy certificate" do
    assert_difference('Certificate.count', -1) do
      delete certificate_url(@certificate), as: :json
    end

    assert_response 204
  end
end
