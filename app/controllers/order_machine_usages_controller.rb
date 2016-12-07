class OrderMachineUsagesController < ApplicationController
  respond_to :html

  def new
    @machine_usage = order.order_machine_usages.build
    respond_with @machine_usage
  end

  def create
    @machine_usage = order.order_machine_usages.create permitted_params
    respond_with @machine_usage, location: -> { order_order_machine_usages_url(order) }
  end

  def edit
    @machine_usage = order.order_machine_usages.find params[:id]
    respond_with @machine_usages
  end

  def update
    @machine_usage = order.order_machine_usages.find params[:id]
    @machine_usage.update permitted_params
    respond_with @machine_usage, location: -> { order_order_machine_usages_url(order) }
  end

  def index
    redirect_to order
    #@machine_usages = order.order_machine_usages.all
    #respond_with @machine_usages
  end

  def destroy
    usage = order.order_machine_usages.find params[:id]
    usage.destroy
    respond_with usage, location: -> { order_order_machine_usages_url(order) }
  end

  private

  def order
    @order = Order.find params[:order_id]
  end

  def permitted_params
    params.require(:order_machine_usage).permit!
  end
end
