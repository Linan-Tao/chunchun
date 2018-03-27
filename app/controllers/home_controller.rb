class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token  
  # GET /homes
  # GET /homes.json
  def index
    # @homes = Home.all
  end

  def get_upload_token
    access_key = ENV['QINIU_ACCESS_KEY']
    secret_key = ENV['QINIU_ACCESS_SECRET']
    bucket     = ENV['QINIU_BUCKET']
    Qiniu.establish_connection! access_key: access_key, secret_key: secret_key
    put_policy = ::Qiniu::Auth::PutPolicy.new(
      bucket, # 存储空间
      nil,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
      600    # token 过期时间，默认为 3600 秒，即 1 小时
    )

    
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)
    render :json => {token: uptoken}
  end

end
