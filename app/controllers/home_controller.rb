class HomeController < ApplicationController
  def index
  	@user = current_user
  	@photos = Photo.all
  end
end
