require 'test_helper'

class WxliteSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wxlite_setting = wxlite_settings(:one)
  end

  test "should get index" do
    get wxlite_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_wxlite_setting_url
    assert_response :success
  end

  test "should create wxlite_setting" do
    assert_difference('WxliteSetting.count') do
      post wxlite_settings_url, params: { wxlite_setting: { banners: @wxlite_setting.banners, delivery_fee: @wxlite_setting.delivery_fee } }
    end

    assert_redirected_to wxlite_setting_url(WxliteSetting.last)
  end

  test "should show wxlite_setting" do
    get wxlite_setting_url(@wxlite_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_wxlite_setting_url(@wxlite_setting)
    assert_response :success
  end

  test "should update wxlite_setting" do
    patch wxlite_setting_url(@wxlite_setting), params: { wxlite_setting: { banners: @wxlite_setting.banners, delivery_fee: @wxlite_setting.delivery_fee } }
    assert_redirected_to wxlite_setting_url(@wxlite_setting)
  end

  test "should destroy wxlite_setting" do
    assert_difference('WxliteSetting.count', -1) do
      delete wxlite_setting_url(@wxlite_setting)
    end

    assert_redirected_to wxlite_settings_url
  end
end
