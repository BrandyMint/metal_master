class WorkDatesController < ApplicationController
  def index
    @work_dates = WorkDate.ordered
    respond_with @work_dates
  end

  def new
    @work_date = WorkDate.new default_work_date
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

  def default_work_date
    permitted_params.presence || { date: default_date, workers: default_workers }
  end

  def default_date
    date = WorkDate.ordered.last.try(:date)
    date.present? ? date + 1.day : Date.current
  end

  def default_workers
    wd = WorkDate.ordered.where('workers > 0').last.try(:workers) || WorkDate::DEFAULT_WORKERS
  end

  def permitted_params
    params.require(:work_date).permit!
  end
end
