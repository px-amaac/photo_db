class HomeController < ApplicationController
  def index
  	@user = current_user
  	if params[:searchkey] && params[:searchvalue].blank?
      @photos = Photo.joins(:tags).where(tags: {key: params[:searchkey] }).order("created_at DESC").distinct
    elsif params[:searchvalue] && params[:searchkey].blank?
      @photos = Photo.joins(:tags).where(tags: {value: params[:searchvalue] }).order("created_at DESC").distinct
    elsif params[:searchkey] && params[:searchvalue]
      @photos = Photo.joins(:tags).where(:tags => { :key => params[:searchkey], :value => params[:searchvalue] }).order("created_at DESC").distinct
    else  
      @photos = Photo.order("created_at DESC")
    end
  end
end
