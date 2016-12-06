require 'test_helper'

class OrderMachinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_machines_index_url
    assert_response :success
  end

  test "should get new" do
    get order_machines_new_url
    assert_response :success
  end

  test "should get create" do
    get order_machines_create_url
    assert_response :success
  end

  test "should get destroy" do
    get order_machines_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get order_machines_edit_url
    assert_response :success
  end

  test "should get update" do
    get order_machines_update_url
    assert_response :success
  end

end
