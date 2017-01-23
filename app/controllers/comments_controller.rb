class CommentsController < ApplicationController
  def index
    render json: Comments.all
  end
end
