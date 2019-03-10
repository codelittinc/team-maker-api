class ScheduleTypesController < ApplicationController
  def index
    @schedule_types = ScheduleType.all

    render json: @schedule_types
  end
end
