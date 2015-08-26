class PinsController < ApplicationController
  before_action :find_pin , only: [:edit,:update,:show,:destroy, :upvote]
  before_action :authenticate_user!, except: [:index,:show]
  
  def show
    @comments = @pin.comments
  end
  
  def index
    @pins = Pin.all.order("created_at DESC")
  end
  
  def new
    @pin = current_user.pins.build
  end
  
  def create
    @pin = current_user.pins.build(pin_params)
    
    if @pin.save
      redirect_to @pin
      flash[:success] = "Successfully created new pin"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @pin.update(pin_params)
      redirect_to @pin
      flash[:success] = "Pin updated Successfully"
    else
      render 'edit'
    end
  end
  
  def destroy
    @pin.destroy
    redirect_to root_path
    flash[:success] = "Pin deleted Successfully"
  end
  
  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @pin.downvote_by current_user
    redirect_to :back
  end
  
  private
    def find_pin
      @pin = Pin.find(params[:id])
    end
    
    def pin_params
      params.require(:pin).permit(:title,:description,:image)
    end
    
  
end
