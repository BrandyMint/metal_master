class SitesController < ApplicationController
  respond_to :html

  def new
    @site = Site.new
    respond_with @site
  end

  def create
    @site = Site.create permitted_params
    respond_with @site
  end

  def index
    @sites = machine.sites.ordered
    respond_with @sites
  end

  def edit
    @site = Site.find params[:id]
    respond_with @site
  end

  def update
    @site = Site.find params[:id]
    @site.update permitted_params
    respond_with @site
  end

  def destroy
    @site = Site.find params[:id]
    @site.destroy
    respond_with @site
  end

  private

  def machine
    @machine ||= Machine.find params[:machine_id]
  end

  def permitted_params
    params.require(:site).permit!
  end
end
