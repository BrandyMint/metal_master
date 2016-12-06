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

    @table = build_order_table @order
    respond_with @order
  end

  private

  def build_rows(usages)
    usages.map do |u|
      [u] +
        build_rows(u.before_linked_usages.with_start_condition(:after_start)) +
        build_rows(u.before_linked_usages.with_start_condition(:after_finish))
    end.flatten
  end

  def build_order_table(order)
    rows = build_rows order.order_machine_usages.with_start_condition(:none)
    max_steps = rows.map(&:last_step).max
    { rows: rows, max_steps: max_steps || 0 }
  end

  def permitted_params
    params.require(:order).permit!
  end
end
