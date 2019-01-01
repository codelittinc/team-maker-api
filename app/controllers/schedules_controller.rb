class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all

    render json: @schedules
  end

  def show
    @schedule = schedule

    render json: @schedule
  rescue StandardError => error
    render json: { error: error }
  end

  def destroy
    @schedule = schedule

    @schedule.destroy
  rescue StandardError => error
    render json: { error: error }
  end

  private

  def schedule_id_params
    params.permit(:id)
  end

  def schedule
    Schedule.find(schedule_id_params[:id])
  end
end
