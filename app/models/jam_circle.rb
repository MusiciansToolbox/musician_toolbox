class JamCircle < ActiveRecord::Base
  belongs_to :user
  has_many :clips

  validates :user_id, presence: true
  validates :open, :inclusion => {:in => [true, false]}
  validates :public, :inclusion => {:in => [true, false]}
  validates :title, presence: true, allow_blank: false

  accepts_nested_attributes_for :clips
end
