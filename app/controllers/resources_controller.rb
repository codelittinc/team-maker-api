class ResourcesController < ApplicationController
  def index
    @resources = Resource.all

    render json: @resources
  end

  def show
    @resource = Resource.find(resource_id_params[:id])

    render json: @resource
  end

  private

  def resource_id_params
    params.permit(:id)
  end
end
