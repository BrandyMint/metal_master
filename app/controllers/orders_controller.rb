class OrdersController < ApplicationController
  respond_to :html

  def index
    @orders = Order.all
    respond_with @orders
  end

  def new
    @order = Order.new
    respond_with @order
  end

  def create
    @order = Order.create permitted_params
    respond_with @order
  end

  def edit
    @order = Order.find params[:id]
    respond_with @order
  end

  private

  def permitted_params
    params.require(:order).permit!
  end
end
