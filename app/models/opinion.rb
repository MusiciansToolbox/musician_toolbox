class Opinion < ActiveRecord::Base
  belongs_to :user
  belongs_to :clip

  def musician
    clip.user
  end

  def musician_id
    clip.user_id
  end
end
