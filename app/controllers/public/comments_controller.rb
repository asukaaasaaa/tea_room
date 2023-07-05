class Public::CommentsController < ApplicationController
  def create
    post_tea = PostTea.find(params[:post_tea_id])
    comment = current_customer.comments.new(comment_params)
    comment.post_tea_id = post_tea.id
    comment.save
    redirect_to post_tea_path(post_tea)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_tea_path(params[:post_tea_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
