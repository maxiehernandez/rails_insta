class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]

  def index
    render json: Comment.all
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.json { render :show, status: :ok, location: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
