class OrdersController < ApplicationController
  respond_to :html

  def index
    @orders = Order.ordered
    respond_with @orders
  end

  def new
    @order = Order.new
    respond_with @order
  end

  def destroy
    @order = Order.find params[:id]
    @order.destroy
    respond_with @order
  end

  def create
    @order = Order.create permitted_params
    respond_with @order, location: -> { orders_path }
  end

  def edit
    @order = Order.find params[:id]
    respond_with @order
  end

  def update
    @order = Order.find params[:id]
    @order.update permitted_params
    respond_with @order
  end

  def show
    @order = Order.find params[:id]

    @table = OrderTableBuilder.new.build_table @order
    respond_with @order
  end

  private

  def permitted_params
    params.require(:order).permit!
  end
end
