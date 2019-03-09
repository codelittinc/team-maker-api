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

  def create
    @resource_type = ResourceType.new(resource_type_params)

    if @resource_type.save
      render json: @resource_type, status: :created, location: @resource_type
    else
      render json: @resource_type.errors, status: :unprocessable_entity
    end
  end

  private

  def resource_type_id_params
    params.permit(:id)
  end

  def resource_type_params
    params.require(:resource_type).permit(:name)
  end

  def resource_type
    ResourceType.find(resource_type_id_params[:id])
  end
end
