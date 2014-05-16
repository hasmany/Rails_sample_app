class SoundsController < ApplicationController

  def index
    @sounds = Sound.all
  end

  def new
    @sound = Sound.new
  end

  def create
    #two ways to do this
    # you can .create
    # or you can do .new, followed by .save
    sound = Sound.new(sound_params)
    sound.save
    redirect_to "/sounds/#{sound.id}"
  end

  def show
    @sound = Sound.find(params[:id])
    @comments = @sound.comments
  end

  private

  def sound_params
    params.require(:sound).permit(:title, :soundclound_url)
  end



end

