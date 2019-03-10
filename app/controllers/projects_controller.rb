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

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_id_params
    params.permit(:id)
  end

  def project_params
    params.require(:project).permit(:name, :project_status_id)
  end

  def project
    Project.find(project_id_params[:id])
  end
end
