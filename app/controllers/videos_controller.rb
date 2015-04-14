class VideosController < ApplicationController
  def index
    @video = Video.new
    @videos = Video.all
  end

  def create
    Video.create params[:video].permit(:title)
    redirect_to :back
  end

  def edit
    @video = Video.find params[:id]
  end

  def update
    video = Video.find params[:id]

    # Try to update the object
    if video.update_attributes params[:video].permit(:title)
      redirect_to videos_path, :notice => 'Your video was updated'
    else
      redirect_to :back, :notice => 'There was an error saving your video'
    end
  end
end
