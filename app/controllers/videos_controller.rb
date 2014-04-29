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

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    # @video.attributes(video_params)
    @video.update(video_params)
    redirect_to root_path
    # Notice, our show and edit actions are exaclty the same!
    # in both cases we grabbign an existing instance of Video
    # to do something
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to root_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :youtube_id)
  end



end





