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

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    if @ad.update(ad_params)
      flash[:notice] = 'Ad has been updated.'
      redirect_to ad_path(@ad)
    else
      flash.now[:alert] = 'Ad has not been created.'
      render 'edit'
    end
  end

  def destroy
    @ad = Ad.find(params[:id])

    @ad.destroy
    flash[:notice] = 'Ad has been deleted.'
    redirect_to ads_path
  end

  private

  def ad_params
    params.require(:ad).permit(:name, :description, :email, :img_url, :seller_id)
  end
end
