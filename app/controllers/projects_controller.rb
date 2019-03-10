class ProjectsController < ApplicationController
  def index
    @projects = Project.all

    render json: @projects
  end

  def show
    @projects = project

    render json: @projects
  rescue StandardError => error
    render json: { error: error }
  end

  private

  def project_id_params
    params.permit(:id)
  end

  def project
    Project.find(project_id_params[:id])
  end
end
