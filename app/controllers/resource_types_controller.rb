class ResourceTypesController < ApplicationController
  def index
    @resource_types = ResourceType.all

    render json: @resource_types
  end

  def show
    @resource_type = resource_type

    render json: @resource_type
  rescue StandardError => error
    render json: { error: error }
  end

  private

  def resource_type_id_params
    params.permit(:id)
  end

  def resource_type
    ResourceType.find(resource_type_id_params[:id])
  end
end
