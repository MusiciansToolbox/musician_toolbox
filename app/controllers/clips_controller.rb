class ClipsController < ApplicationController
  before_action :authenticate_user
  before_action :set_user
  include Transloadit::Rails::ParamsDecoder

  def new
    @clip = Clip.new
    # @clip = @user.clips.build
  end

  def index
    @clips = Clip.all
    @clip = Clip.new
  end


  def create
    Rails.logger.info("PARAMS: #{params[:transloadit].inspect}")
    url = params[:transloadit][:results][:mp3][0]["url"]
    duration = params[:transloadit][:results][:mp3][0][:meta]["duration"]
    if duration <= 10.00
      @clip = Clip.new(clip_params)
      @clip.uploaded_file = url
      if @clip.save
        redirect_to root_path, notice: "Clip successfully made"
      else
        render :new, as: :new_file, notice: "Clip failed to upload"
      end
    else
      redirect_to search_path
    end
  end

  private

  def clip_params
    params.require(:clip).permit(:user_id, :instrument_id, :genre,
        :uploaded_file, :title, :jam_circle_id, :previous_clip_id
    )
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
