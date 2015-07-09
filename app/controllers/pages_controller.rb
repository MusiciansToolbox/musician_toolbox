class PagesController < ApplicationController
  before_action :authenticate_user
  before_action :set_user, only: [:home]


  def home
  end

  def music
    @user = User.find_by_id(session[:user_id])
    @clips = Clip.where(user_id: @user.id)
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

  private

  def set_user
    @user = User.find(session[:user_id])
  end
end
