class PagesController < ApplicationController
  before_action :authenticate_user


  def home
  end

  def music
    @user = User.find_by_id(session[:user_id])
    @clips = Clip.find_by_user_id(@user.id)
  end

  def new_file
    # @clip = current_.clips.build
  end

  def musical_preferences
    @user = User.find_by_id(params[:id])

    @user_genres = @user.genres
    @user_instruments = @user.instruments

    @all_genres = Genre.all

    # @user.instruments.build
    @user.genres.build

  end

  def add_instrument_partial
    @all_instruments = Instrument.all
  end

  def add_genre_partial
    @all_genres = Genre.all
  end
end
