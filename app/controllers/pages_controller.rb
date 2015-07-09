class PagesController < ApplicationController
  before_action :authenticate_user


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

  def likes

  end

  def search
    if request.get?
      @get = true
      @search = UserSearch.new()
    else
      @search = UserSearch.new(user_search)
      @search.searcher_id = session[:user_id]
      # UserSearch.search_musicians(zipcode:,genre_id:,instrument_id:)
      @search.save!
    end
  end

  def user_search
    params.require(:user_search).permit(:zipcode, :genre_id, :instrument_id, :default_search, :searcher_id)
  end


end
