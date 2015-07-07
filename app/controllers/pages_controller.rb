class PagesController < ApplicationController
  before_action :authenticate_user


  def home
  end

  def new_file
    # @clip = current_.clips.build
  end

<<<<<<< HEAD
=======
  def musical_preferences
    @user = User.find_by_id(params[:id])
  end
>>>>>>> 7f622176ba43a98b09b7330fe97d57cf47096293
end
