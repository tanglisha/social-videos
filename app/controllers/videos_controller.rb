class VideosController < ApplicationController
  def index
    @video = Video.new
    @videos = Video.all
  end

  def create
    Video.create params[:title]
    redirect_to :back
  end
end
