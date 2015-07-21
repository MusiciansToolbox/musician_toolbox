class JamCircle < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :clips

  validates :user_id, presence: true
#  validates :open, :inclusion => {:in => [true, false]}
#  validates :public, :inclusion => {:in => [true, false]}
  validates :title, presence: true, allow_blank: false

  accepts_nested_attributes_for :clips

  def tree_data
    root_clip = self.clips.where(previous_clip_id: nil).first
    # ary_children_of_root = self.clips.where(previous_clip_id: root_clip.id)
    {"root" => root_clip }
  end

  def root_clip
    self.clips.where(previous_clip_id: nil).first
  end
end
