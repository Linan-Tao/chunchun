class V1::Auth < V1::Base
  namespace :auth do
    desc '通过code换取用户信息'
    params do
      requires :code
    end
    get :login do
      query = {}
      query[:appid] = ENV['WECHAT_LITE_APPID']
      query[:secret] = ENV['WECHAT_LITE_SECRET']
      query[:js_code] = params[:code]
      query[:grant_type] = 'authorization_code'
      client = Faraday.new("https://api.weixin.qq.com/sns/jscode2session?#{query.to_query}")
      resp = client.get
      data = JSON.parse(resp.body)
      if data['openid'] && data['session_key']
        Visitor.find_or_create_by!(uid: data['openid'])
        encode_visitor_token openid: data['openid'], session_key: data['session_key']
      else
        ''
      end
    end

    desc '更新用户信息'
    params do
      requires :userInfo, type: Hash
      requires :rawData
      requires :signature
    end
    put :profile do
      if current_visitor && Digest::SHA1.hexdigest("#{params[:rawData]}#{current_visitor.session_key}") == params[:signature]
        user_info = params[:userInfo]
        current_visitor.update_attributes(
          nickname: user_info['nickName'],
          headshot: user_info['avatarUrl']
        )
        'success'
      end
    end
  end
end
