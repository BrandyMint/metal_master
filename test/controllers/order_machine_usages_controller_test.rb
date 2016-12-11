require 'test_helper'

class OrderMachineUsagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_machine_usage = order_machine_usages(:one)
  end

  test "should get index" do
    get order_machine_usages_url
    assert_response :success
  end

  test "should get new" do
    get new_order_machine_usage_url
    assert_response :success
  end

  test "should create order_machine_usage" do
    assert_difference('OrderMachineUsage.count') do
      post order_machine_usages_url, params: { order_machine_usage: {  } }
    end

    assert_redirected_to order_machine_usage_url(OrderMachineUsage.last)
  end

  test "should show order_machine_usage" do
    get order_machine_usage_url(@order_machine_usage)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_machine_usage_url(@order_machine_usage)
    assert_response :success
  end

  test "should update order_machine_usage" do
    patch order_machine_usage_url(@order_machine_usage), params: { order_machine_usage: {  } }
    assert_redirected_to order_machine_usage_url(@order_machine_usage)
  end

  test "should destroy order_machine_usage" do
    assert_difference('OrderMachineUsage.count', -1) do
      delete order_machine_usage_url(@order_machine_usage)
    end

    assert_redirected_to order_machine_usages_url
  end
end
