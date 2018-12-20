class ResourcesController < ApplicationController
  def index
    @resources = Resource.all

    render json: @resources
  end

  def show
    @resource = resource

    render json: @resource
  rescue StandardError => error
    render json: { error: error }
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @resource = resource

    @resource.destroy
  rescue StandardError => error
    render json: { error: error }
  end

  def update
    @resource = resource

    if @resource.update(resource_params)
      render json: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  private

  def resource_id_params
    params.permit(:id)
  end

  def resource_params
    params.require(:resource).permit(:name, :role_id, :resource_type_id)
  end

  def resource
    Resource.find(resource_id_params[:id])
  end
end
