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

  def create
    @schedule_type = ScheduleType.new(schedule_type_params)

    if @schedule_type.save
      render json: @schedule_type, status: :created, location: @schedule_type
    else
      render json: @schedule_type.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule_type = schedule_type

    @schedule_type.destroy
  rescue StandardError => error
    render json: { error: error }
  end

  def update
    @schedule_type = schedule_type

    if @schedule_type.update(schedule_type_params)
      render json: @schedule_type
    else
      render json: @schedule_type.errors, status: :unprocessable_entity
    end
  end

  private

  def schedule_type_id_params
    params.permit(:id)
  end

  def schedule_type_params
    params.require(:schedule_type).permit(:name)
  end

  def schedule_type
    ScheduleType.find(schedule_type_id_params[:id])
  end
end
