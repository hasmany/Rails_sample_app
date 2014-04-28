class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    video = Video.new(video_params)
    video.save
    redirect_to root_path # goes to the video index?

  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :youtube_id)
  end

end






