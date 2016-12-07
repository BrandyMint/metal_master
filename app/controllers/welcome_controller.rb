class WelcomeController < ApplicationController
  def index
    @machines = Machine.ordered
  end
end
