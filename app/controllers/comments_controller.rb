class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create 
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end
  private

def comment_params
  params.require(:comment).permit(:body)
end
end
