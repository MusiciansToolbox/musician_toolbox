class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
  end

  def new_file
    @clip = current_user.clips.build
  end
end
