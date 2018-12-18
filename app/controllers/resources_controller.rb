class ResourcesController < ApplicationController
  def index
    @resources = Resource.all

    render json: @resources
  end

  def show
    @resource = Resource.find(params[:id])

    render json: @resource
  end
end
