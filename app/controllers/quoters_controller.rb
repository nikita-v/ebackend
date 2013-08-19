class QuotersController < ApplicationController
  before_action :load_quoter, :only => [:edit, :update, :destroy]
  before_action :authenticate_user!, :except => :index
  
  def index
    @quoters = Quoter.all
  end

  def new
    @quoter = Quoter.new
  end

  def create
    @quoter = Quoter.new quoter_params
    if @quoter.save
      redirect_to :action => :index
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @quoter.update_attributes quoter_params
      redirect_to :action => :index
    else
      render :edit
    end
  end

  def destroy
    @quoter.destroy
    redirect_to :action => :index
  end
  
  private
  
  def load_quoter
    @quoter = Quoter.find(params[:id])
  end
  
  def quoter_params
    params.require(:quoter).permit(:name, :rss_url)
  end
end
