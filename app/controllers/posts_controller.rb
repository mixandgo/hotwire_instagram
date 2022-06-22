class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  private

    def post_params
      params.require(:post).permit(:body, :file)
    end
end
