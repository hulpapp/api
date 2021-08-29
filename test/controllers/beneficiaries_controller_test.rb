require "test_helper"

class BeneficiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beneficiary = beneficiaries(:one)
  end

  test "should get index" do
    get beneficiaries_url, as: :json
    assert_response :success
  end

  test "should create beneficiary" do
    assert_difference('Beneficiary.count') do
      post beneficiaries_url, params: { beneficiary: { address_id: @beneficiary.address_id, birthDate: @beneficiary.birthDate, document: @beneficiary.document, name: @beneficiary.name } }, as: :json
    end

    assert_response 201
  end

  test "should show beneficiary" do
    get beneficiary_url(@beneficiary), as: :json
    assert_response :success
  end

  test "should update beneficiary" do
    patch beneficiary_url(@beneficiary), params: { beneficiary: { address_id: @beneficiary.address_id, birthDate: @beneficiary.birthDate, document: @beneficiary.document, name: @beneficiary.name } }, as: :json
    assert_response 200
  end

  test "should destroy beneficiary" do
    assert_difference('Beneficiary.count', -1) do
      delete beneficiary_url(@beneficiary), as: :json
    end

    assert_response 204
  end
end
