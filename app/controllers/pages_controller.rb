class PagesController < ApplicationController
  before_action :authenticate_user


  def home
  end

  def new_file
    # @clip = current_.clips.build
  end

  def musical_preferences
    @user = User.find_by_id(params[:id])

    @user_genres = @user.genres
    @user_instruments = @user.instruments

    @all_genres = Genre.all
    @all_instruments = Instrument.all
  end
end
