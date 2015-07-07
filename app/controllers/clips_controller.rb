class ClipsController < ApplicationController
  before_action :authenticate_user

  def new
    @clip = Clip.new
    # @clip = @user.clips.build
  end

  def index
    @clips = Clip.all
    @clip = Clip.new
  end


  def create
    @clip = Clip.new(clip_params)
    if @clip.save
      redirect_to root_path, notice: "Clip successfully made"
    else
      redirect_to new_file_path, notice: "Clip failed to upload"
    end
  end

  private

  def clip_params
    params.require(:clip).permit(:user_id, :instrument_id, :genre, :uploaded_file)
  end
end
