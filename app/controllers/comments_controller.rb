class CommentsController < ApplicationController
  
    def create 
     @post = Post.find(params[:post_id])
     @topic = @post.topic
     @comment = current_user.comments.build(comment_params)
     # this automatically sets @comment.user_id = current_user.id
     #@comment = Comment.new comment_params
     #@comment.user_id = current_user.id

    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     @topic = @post.topic
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
     end
     redirect_to [@topic, @post]
   end
  private

def comment_params
  params.require(:comment).permit(:body)
end
end
