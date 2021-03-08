class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/posts/#{@comment.post.id}"
    else
      @post = Post.find(@comment.post.id)
      @comments = @post.comments.includes(:user)
      render "posts/show"
    end
  end

private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
