class WorkDatesController < ApplicationController
  def index
    @work_dates = WorkDate.ordered
    respond_with @work_dates
  end

  def new
    @work_date = WorkDate.new date: default_date, is_business: is_business_day?(default_date)
    respond_with @work_date
  end

  def destroy
    @work_date = WorkDate.find params[:id]
    @work_date.destroy
    respond_with @work_date
  end

  def create
    @work_date = WorkDate.create permitted_params
    respond_with @work_date, location: -> { work_dates_path }
  end

  def edit
    @work_date = WorkDate.find params[:id]
    respond_with @work_date
  end

  def update
    @work_date = WorkDate.find params[:id]
    @work_date.update permitted_params
    respond_with @work_date
  end

  def show
    @work_date = WorkDate.find params[:id]
    respond_with @work_date
  end

  private

  def is_business_day?(date)
    !(date.saturday? || date.sunday?)
  end

  def default_date
    date = WorkDate.ordered.last.try(:date)
    date.present? ? date + 1.day : Date.current
  end

  def permitted_params
    params.require(:work_date).permit!
  end
end
