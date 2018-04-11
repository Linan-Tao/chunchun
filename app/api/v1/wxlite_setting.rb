module V1
  class WxliteSetting < Base
    resources :wxlite_settings do
      desc '设置' do
        success Entities::WxliteSetting
      end
      get do
        settings = ::WxliteSetting.first
        present settings, with: Entities::WxliteSetting
      end
    end
  end
end
