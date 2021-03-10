class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(params[:id])
    else
      @post = Post.find(params[:id])
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def category
    @post = Post.find_by(category_id: params[:id])
    @posts = Post.where(category_id: params[:id]).order('created_at DESC')
  end

  def search
    # Viewのformで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :category_id).merge(user_id: current_user.id)
  end
end
