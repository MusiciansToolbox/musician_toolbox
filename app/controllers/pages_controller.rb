class PagesController < ApplicationController
  before_action :authenticate_user


  def home
  end

  def new_file
    # @clip = current_.clips.build
  end

  def musical_preferences
    @user = User.find_by_id(params[:id])
  end
end
