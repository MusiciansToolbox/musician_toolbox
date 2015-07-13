class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :update, :edit]
  before_action :authenticate_user, except: [:new, :create]


  def new
    @user = User.new
  end

  def edit
  end

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

 # PATCH/PUT /users/1
 # PATCH/PUT /users/1.json
  def update
   respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_instrument
    user = User.find(session[:user_id])

    instrument = Instrument.find( params[:instrument_id] )

    user.instruments.delete(instrument)

    user.instruments << instrument

    @user_instruments = user.instruments
  end

  def add_genre
    user = User.find( session[:user_id] )

    genre = Genre.find( params[:genre_id] )

    user.genres.delete(genre)

    user.genres << genre

    @user_genres = user.genres
  end

  def add_influence
    user = User.find( session[:user_id] )

    Influence.create(name: params[:influence_name], user_id: user.id )

    @user_influences = user.influences
  end

  def rm_instrument
    u = User.find( session[:user_id] )
    u.instruments.destroy(Instrument.find(params[:instrument_id]))
    @user_instruments = u.instruments
    render 'add_instrument.js.erb'
  end

  def rm_genre
    u = User.find( session[:user_id] )
    u.genres.destroy(Genre.find(params[:genre_id]))
    @user_genres = u.genres
    render 'add_genre.js.erb'
  end

  def rm_influence
    u = User.find( session[:user_id] )
    u.influences.destroy(Influence.find(params[:influence_id]))
    @user_influences = u.influences
    render 'add_influence.js.erb'
  end

  def like_clip
    @user = User.find( session[:user_id] )
    clip_id = params[:clip_id]
    if request.post?
      @user.likes.new(user_id: @user.id, clip_id: clip_id, positive: true)
      @user.save
    elsif request.delete?
      Like.destroy( (Like.where( user_id: user.id, clip_id: params[:clip_id] ))[0].id )
    end
  end

  def dislike_clip
    @user = User.find( session[:user_id] )
    clip_id = params[:clip_id]
    if request.post?
      @user.likes.new(user_id: @user.id, clip_id: clip_id, positive: false)
      @user.save
    elsif request.delete?
      Like.destroy( (Like.where( user_id: user.id, clip_id: params[:clip_id] ))[0].id )
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, #:influence,
      :profile_picture, :description, :zipcode, :influences, instruments_attributes: [:name])
    end
end
