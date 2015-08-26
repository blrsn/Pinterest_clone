class PinsController < ApplicationController
  before_action :find_pin , only: [:edit,:update,:show,:destroy]
  
  def show
  end
  
  def index
    @pins = Pin.all.order("created_at DESC")
  end
  
  def new
    @pin = current_user.pins.build
  end
  
  def create
    @pin = current_user.pins.build
    
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
  
  private
    def find_pin
      @pin = Pin.find(params[:id])
    end
    
    def pin_params
      params.require(:pin).permit(:title,:description)
    end
  
end
