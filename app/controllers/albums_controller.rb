class AlbumsController < ApplicationController
  before_action :require_login

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.destroy(params[:id])
    redirect_to band_url(@album.band_id)
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  private

  def album_params
    params.require(:album).permit(:name, :recording_type, :band_id)
  end
end
