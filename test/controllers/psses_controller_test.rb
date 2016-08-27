require 'test_helper'

class PssesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pss = psses(:one)
  end

  test "should get index" do
    get psses_url
    assert_response :success
  end

  test "should get new" do
    get new_pss_url
    assert_response :success
  end

  test "should create pss" do
    assert_difference('Pss.count') do
      post psses_url, params: { pss: { computer: @pss.computer, player: @pss.player, win_lose: @pss.win_lose } }
    end

    assert_redirected_to pss_url(Pss.last)
  end

  test "should show pss" do
    get pss_url(@pss)
    assert_response :success
  end

  test "should get edit" do
    get edit_pss_url(@pss)
    assert_response :success
  end

  test "should update pss" do
    patch pss_url(@pss), params: { pss: { computer: @pss.computer, player: @pss.player, win_lose: @pss.win_lose } }
    assert_redirected_to pss_url(@pss)
  end

  test "should destroy pss" do
    assert_difference('Pss.count', -1) do
      delete pss_url(@pss)
    end

    assert_redirected_to psses_url
  end
end
