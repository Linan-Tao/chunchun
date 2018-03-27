class CatalogsController < ApplicationController
  before_action :set_admin_catalog, only: [:edit, :update, :destroy, :tags]
  skip_before_action :verify_authenticity_token  
  # GET /admin/catalogs
  def index
    respond_to do |format|
      format.html
      format.json do
        @catalogs = catalog_model.roots
        render json: catalog_json_data(@catalogs)
      end
    end
  end

  # GET /admin/catalogs/1
  def show
  end

  # GET /admin/catalogs/new
  def new
    @admin_catalog = catalog_model.new
  end

  # GET /admin/catalogs/1/edit
  def edit
  end

  # POST /admin/catalogs
  def create
    @admin_catalog = catalog_model.new(admin_catalog_params)
    if @admin_catalog.save
      render json: catalog_json_data(@admin_catalog)
    else
      render json: @admin_catalog.errors, status: :failed
    end
  end

  # PATCH/PUT /admin/catalogs/1
  def update
    @admin_catalog.assign_attributes(admin_catalog_params)
    if @admin_catalog.save
      head :ok
    else
      render json: @admin_catalog.errors.as_json, status: :failed
    end
  end

  # DELETE /admin/catalogs/1
  def destroy
    if @admin_catalog.destroy
      head :ok
    else
      render json: { message: @admin_catalog.errors.full_messages.join(', ') }, status: :failed
    end
  end

  def tags
    # 获取自己及祖先的标签
    catalog = @admin_catalog.self_and_ancestors
    render json: catalog.map(&:tag_list).flatten.uniq
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_catalog
      @admin_catalog = catalog_model.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_catalog_params
      params.permit(:parent_id, :name, :position)
    end

    def catalog_json_data(catalogs)
      catalogs.as_json(only: [:id, :name],  methods: [:children_data])
    end

    def catalog_model
      Catalog
    end

end
