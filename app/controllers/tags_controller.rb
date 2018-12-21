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

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  private

  def tag_id_params
    params.permit(:id)
  end

  def tag_params
    params.require(:tag).permit(:name, :resource_id)
  end

  def tag
    Tag.find(tag_id_params[:id])
  end
end
