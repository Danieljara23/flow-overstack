class CommentsController < ApplicationController
  
  def create
  	@comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'The comment have been saved'
      redirect_to post_path(id: @comment.post_id, it_was: 'created')
    else
      redirect_to post_path(id: @comment.post_id, it_was: 'createdno')
    end
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id,:content)
  end

end
