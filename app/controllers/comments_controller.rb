class CommentsController < ApplicationController
  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.create(comments_params)
    
    redirect_to @pin
  end
  
  def destroy
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.find(params[:id])
    
    @comment.destroy
    redirect_to @pin
  end
  
  private
  
  def comments_params
    params.require(:comment).permit(:name,:body)
  end
end
