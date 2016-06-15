class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      render partial: 'comments/comment',
             locals: { comment: @comment },
             status: :created
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:context, :restaurant_id)
  end
end