require 'test_helper'

class WorkDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_date = work_dates(:one)
  end

  test "should get index" do
    get work_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_work_date_url
    assert_response :success
  end

  test "should create work_date" do
    assert_difference('WorkDate.count') do
      post work_dates_url, params: { work_date: { date: '01-01-2016' } }
    end

    assert_redirected_to work_dates_url
  end

  test "should show work_date" do
    get work_date_url(@work_date)
    assert_redirected_to edit_work_date_url(@work_date)
  end

  test "should get edit" do
    get edit_work_date_url(@work_date)
    assert_response :success
  end

  test "should update work_date" do
    patch work_date_url(@work_date), params: { work_date: { workers: 12 } }
    assert_redirected_to work_dates_url
  end

  test "should destroy work_date" do
    assert_difference('WorkDate.count', -1) do
      delete work_date_url(@work_date)
    end

    assert_redirected_to work_dates_url
  end
end
