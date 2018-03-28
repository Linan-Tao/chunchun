class WxliteSettingsController < ApplicationController
  before_action :set_wxlite_setting, only: [:show, :edit, :update, :destroy]

  # GET /wxlite_settings
  # GET /wxlite_settings.json
  def index
    # @wxlite_settings = WxliteSetting.all
    @website_setting = WxliteSetting.first || WxliteSetting.new
  end

  # GET /wxlite_settings/1
  # GET /wxlite_settings/1.json
  def show
  end

  # GET /wxlite_settings/new
  def new
    @wxlite_setting = WxliteSetting.new
  end

  # GET /wxlite_settings/1/edit
  def edit
  end

  # POST /wxlite_settings
  # POST /wxlite_settings.json
  def create
    @wxlite_setting = WxliteSetting.new(wxlite_setting_params)
    respond_to do |format|
      if @wxlite_setting.save
        format.html { redirect_to wxlite_settings_path, notice: 'Wxlite setting was successfully created.' }
        format.json { render :show, status: :created, location: @wxlite_setting }
      else
        format.html { render :new }
        format.json { render json: @wxlite_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wxlite_settings/1
  # PATCH/PUT /wxlite_settings/1.json
  def update
    respond_to do |format|
      if @wxlite_setting.update(wxlite_setting_params)
        format.html { redirect_to wxlite_settings_path, notice: 'Wxlite setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @wxlite_setting }
      else
        format.html { render :edit }
        format.json { render json: @wxlite_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wxlite_settings/1
  # DELETE /wxlite_settings/1.json
  def destroy
    @wxlite_setting.destroy
    respond_to do |format|
      format.html { redirect_to wxlite_settings_url, notice: 'Wxlite setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wxlite_setting
      @wxlite_setting = WxliteSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wxlite_setting_params
      params.require(:wxlite_setting).permit(:delivery_fee, :banners => [])
    end
end
