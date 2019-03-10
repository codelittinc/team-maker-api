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

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      render json: @schedule, status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
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

  def schedule_params
    params.require(:schedule).permit(:project_id, :resource_id, :schedule_type_id)
  end

  def schedule
    Schedule.find(schedule_id_params[:id])
  end
end
