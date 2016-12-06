require 'test_helper'

class OrderMachineUsageIntervalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_machine_usage_intervals_index_url
    assert_response :success
  end

  test "should get new" do
    get order_machine_usage_intervals_new_url
    assert_response :success
  end

  test "should get create" do
    get order_machine_usage_intervals_create_url
    assert_response :success
  end

  test "should get destroy" do
    get order_machine_usage_intervals_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get order_machine_usage_intervals_edit_url
    assert_response :success
  end

  test "should get update" do
    get order_machine_usage_intervals_update_url
    assert_response :success
  end

end
