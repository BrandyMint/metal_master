class MachinesController < ApplicationController
   respond_to :html

   def new
     @machine = Machine.new
     respond_with @machine
   end

   def create
     @machine = Machine.create permitted_params
     respond_with @machine
   end

   def index
     @machines = Machine.ordered
     respond_with @machines
   end

  def edit
    @machine = Machine.find params[:id]
    respond_with @machine
  end

  def update
    @machine = Machine.find params[:id]
    @machine.update permitted_params
    respond_with @machine
  end

  def show
    redirect_to edit_machine_url(params[:id])
  end

  def destroy
    @machine = Machine.find params[:id]
    @machine.destroy
    respond_with @machine
  end

   private

   def permitted_params
     params.require(:machine).permit!
   end
end
