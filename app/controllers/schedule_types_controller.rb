class ScheduleTypesController < ApplicationController
  def index
    @schedule_types = ScheduleType.all

    render json: @schedule_types
  end

  def show
    @schedule_type = schedule_type

    render json: @schedule_type
  rescue StandardError => error
    render json: { error: error }
  end

  private

  def schedule_type_id_params
    params.permit(:id)
  end

  def schedule_type
    ScheduleType.find(schedule_type_id_params[:id])
  end
end
