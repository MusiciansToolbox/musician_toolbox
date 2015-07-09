class ClipsController < ApplicationController
  before_action :authenticate_user
  before_action :set_user

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
      render :new, as: :new_file, notice: "Clip failed to upload"
    end
  end

  private

  def clip_params
    params.require(:clip).permit(:user_id, :instrument_id, :genre, :uploaded_file)
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
