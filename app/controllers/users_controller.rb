class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :update]
  before_action :authenticate_user, except: [:new, :create]


  def new
    @user = User.new
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
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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

  def rm_instrument
    u = User.find( session[:user_id] )
    u.instruments.delete(Instrument.find(params[:instrument_id]))
    @user_instruments = user.instruments
    # render 'add_instrument.js.erb'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :description, :zipcode, :influences,
          instruments_attributes: [:name])
    end
end
