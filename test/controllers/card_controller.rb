class CardControllerTest < ActionDispatch::IntegrationTest
  test "should return false on post serialization" do
    post log_url, params: {name_card:"Fernando", number_bin:123, number_card:4111111111111111, expiration_date:"20/18", schema:"DEBIT", mark_card:"MasterCard" }
    assert_response :bad_request
  end
end
