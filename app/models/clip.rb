class Clip < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrument

  validates :user_id, presence: true, numericality: true
  validates :instrument_id, presence: true, numericality: true
end
