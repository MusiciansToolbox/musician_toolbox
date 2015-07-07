class ClipsController < ApplicationController
  def new
    @clip = current_user.clips.build
  end

  def index
    @clips = Clip.all
    @clip = Clip.new
  end


  def create
    @clip = Clip.new(clip_params)
      # if @clip.save
        redirect_to root_path, notice: "Clip successfully made"
      # else
      #   render :new
      # end
    # end
  end

  private

  def clip_params
    params.require(:clip).permit(:user_id, :instrument_id, :uploaded_file_file_name,
        :uploaded_file_content_type, :uploaded_file_file_size, :uploaded_file_updated_at)
  end
end
