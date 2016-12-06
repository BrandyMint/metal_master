require 'test_helper'

class OrderMachineUsagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_machine_usages_index_url
    assert_response :success
  end

  test "should get new" do
    get order_machine_usages_new_url
    assert_response :success
  end

  test "should get create" do
    get order_machine_usages_create_url
    assert_response :success
  end

  test "should get destroy" do
    get order_machine_usages_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get order_machine_usages_edit_url
    assert_response :success
  end

  test "should get update" do
    get order_machine_usages_update_url
    assert_response :success
  end

end
