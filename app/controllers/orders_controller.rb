class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order('updated_at DESC').page(params[:page])
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @order.status = 'deliveried'
    @order.save!
    redirect_to order_url(@order)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
end
