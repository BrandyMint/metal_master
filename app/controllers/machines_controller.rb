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
     @machines = Machine.all
     respond_with @machines
   end

   private

   def permitted_params
     params.require(:machine).permit!
   end
end
