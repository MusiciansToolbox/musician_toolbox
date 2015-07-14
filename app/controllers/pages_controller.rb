class PagesController < ApplicationController
  before_action :authenticate_user
  before_action :set_user, only: [:home, :search, :likes, :cheat_activated]

  def reroute
    redirect_to likes_path
  end

  def music
    @user = User.find_by_id(session[:user_id])
  end

  def new_file
    # @clip = current_.clips.build
  end

  def musical_preferences
    @user = User.find_by_id(params[:id])
    @user_genres = @user.genres
    @user_instruments = @user.instruments
    @user_influences = @user.influences

  end

  def add_instrument_partial
    @all_instruments = Instrument.all
  end

  def add_genre_partial
    @all_genres = Genre.all
  end

  def search
    if request.get?
      @get = true
      default_search = UserSearch.where(searcher_id: session[:user_id]).where(default_search: true).order(:created_at)
      p default_search
      @search = UserSearch.new()
    else
      @search = UserSearch.new(user_search)
      @search.searcher_id = session[:user_id]
      zipcodes = UserSearch.find_nearby_zipcodes(@search.zipcode, @search.radius)
      @results = UserSearch.search_musicians(zipcodes,@search.genre_id,@search.instrument_id,@user.id)
      @search.save!
    end
  end

  def user_search
    params.require(:user_search).permit(:zipcode, :genre_id,
      :instrument_id, :default_search, :searcher_id, :radius
    )
  end


  private

  def set_user
    @user = User.find(session[:user_id])
  end
end
