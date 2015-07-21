class JamCirclesController < ApplicationController
  before_action :check_user_count
  before_action :authenticate_user
  before_action :set_jam_circle, only: [:show, :edit, :update, :destroy, :tree_data]
  before_action :set_user

  # GET /jam_circles
  # GET /jam_circles.json
  def index
    @jam_circles = @user.jam_circles
    #@jam_circle = JamCircle.new
  end

  # GET /jam_circles/1
  # GET /jam_circles/1.json
  def show
  end

  # GET /jam_circles/new
  def new
    @jam_circle = JamCircle.new
    # @clip = Clip.new
  end

  # GET /jam_circles/1/edit
  def edit
  end

  # POST /jam_circles
  # POST /jam_circles.json
  def create
    @jam_circle = JamCircle.new(jam_circle_params)
    @jam_circle.user_id = @user.id
    @jam_circle.users << @user
    if params[:users]
      user_ids = params[:users].keys
      user_ids.each do |id|
        @jam_circle.users << User.find(id)
      end
    end
    respond_to do |format|
      if @jam_circle.save
        format.html { redirect_to @jam_circle, notice: 'Jam circle was successfully created.' }
        format.json { render :show, status: :created, location: @jam_circle }
      else
        format.html { render :new }
        format.json { render json: @jam_circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jam_circles/1
  # PATCH/PUT /jam_circles/1.json
  def update
    respond_to do |format|
      if @jam_circle.update(jam_circle_params)
        format.html { redirect_to @jam_circle, notice: 'Jam circle was successfully updated.' }
        format.json { render :show, status: :ok, location: @jam_circle }
      else
        format.html { render :edit }
        format.json { render json: @jam_circle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jam_circles/1
  # DELETE /jam_circles/1.json
  def destroy
    @jam_circle.destroy
    respond_to do |format|
      format.html { redirect_to jam_circles_url, notice: 'Jam circle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jam_circle
      @jam_circle = JamCircle.find(params[:id])
      @clip = Clip.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jam_circle_params
      params.require(:jam_circle).permit( :user_id, :title, :description, :open, :public )
    end

    def set_user
      @user = User.find(session[:user_id])
    end

    def check_user_count
      unless User.any?
        session[:user_id] = nil
      end
    end

end
