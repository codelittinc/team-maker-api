class TagsController < ApplicationController
  def index
    @tags = Tag.all

    render json: @tags
  end

  def show
    @tag = tag

    render json: @tag
  rescue StandardError => error
    render json: { error: error }
  end

  private

  def tag_id_params
    params.permit(:id)
  end

  def tag
    Tag.find(tag_id_params[:id])
  end
end
