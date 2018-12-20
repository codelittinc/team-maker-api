class TagController < ApplicationController
  def index
    @tags = Tag.all

    render json: @tags
  end
end
