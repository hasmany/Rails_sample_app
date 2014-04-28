class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    video = Video.new(params)
    video.save
    redirect_to root_path # goes to the video index?

  end

  def show
    @video = Video.find(params[:id])
  end
end

