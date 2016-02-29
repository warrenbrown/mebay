class AdsController < ApplicationController

  def index
    @ads = Ad.all
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)

    if @ad.save
      flash[:notice]= 'Ad has been created.'
      redirect_to ads_path
    else
      flash.now[:alert]= 'Ad has not been created.'
      render 'new'
    end
  end

  def show
    @ad = Ad.find(params[:id])
  end

  private

  def ad_params
    params.require(:ad).permit(:name, :description, :email, :img_url, :seller_id)
  end
end
