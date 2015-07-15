class TransloaditsController < ApplicationController
  before_action :set_user, only: :new
  protect_from_forgery with: :null_session

  include Transloadit::Rails::ParamsDecoder

  def new
  end

  def create
    Rails.logger.info("PARAMS: #{params[:transloadit].inspect}")
    @url = params[:transloadit][:results][:mp3][0]["url"]
    @duration = params[:transloadit][:results][:mp3][0][:meta]["duration"]
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
