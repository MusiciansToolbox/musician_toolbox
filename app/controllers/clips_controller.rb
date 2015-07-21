class ClipsController < ApplicationController
  before_action :authenticate_user
  before_action :set_user
  include Transloadit::Rails::ParamsDecoder

  def retrieve
    id = params[:clip_id]
    @clip = Clip.find(id)
  end

  def new
    @clip = Clip.new
    # @clip = @user.clips.build
  end

  def index
    @clips = Clip.all
    @clip = Clip.new
  end

  def report
    clip = Clip.find_by_id(params[:clip_id])
    clip.reported = true
    clip.save
  end


  def create
    session[:return_to] ||= request.referer
    Rails.logger.info("PARAMS: #{params[:transloadit].inspect}")
    url = params[:transloadit][:results][:mp3][0]["url"]
    duration = params[:transloadit][:results][:mp3][0][:meta]["duration"]
    @clip = Clip.new(clip_params)
    @clip.uploaded_file = url
    if @clip.demo == true && duration > 10.00
      redirect_to profile_path(session[:user_id]), notice: "Demo Clip too long"
    else
      if @clip.save
        redirect_to session.delete(:return_to), notice: "Clip successfully uploaded"
      else
        redirect_to profile_path(session[:user_id]), notice: "Clip failed to load"
      end
    end
  end

  def destroy
    Clip.destroy(params[:clip_id])
    render :nothing => true
  end

  private

  def clip_params
    params.require(:clip).permit(:user_id, :instrument_id, :genre,
        :uploaded_file, :title, :jam_circle_id, :previous_clip_id, :demo
    )
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
