class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    render json: Post.includes(:comments).all
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      render json: { post: @post, comments: "" }, status: :created, localtion: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params).save!
        format.json { render :show, status: :ok, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      new_hash={}
      if params[:data]&&params[:data][:attributes]
        post_data=params[:data][:attributes]
      else
        post_data=params[:post]
      end

      post_data.each do |key,value|
        new_hash[key.gsub("-","_")]=value
      end

      new_params=ActionController::Parameters.new(new_hash)
      new_params.permit(:image_url, :name, :caption)
    end
end
