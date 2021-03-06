class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]
  before_action :correct_user, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!


  # GET /photos
  # GET /photos.json
  def index
    @photos = current_user.photos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @tags = @photo.tags
    @tag = @photo.tags.build
  end

  # GET /photos/new
  def new
    @photo = current_user.photos.build
    @tag = @photo.tags.build
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = current_user.photos.create(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(edit_photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.image = nil
    @photo.save
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def correct_user
      @photo = current_user.photos.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :image, :tags_attributes => [:id, :key, :value, :_destroy])
    end

    def edit_photo_params
      params.require(:photo).permit(:title)

    end
end
