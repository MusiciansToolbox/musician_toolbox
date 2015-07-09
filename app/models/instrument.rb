class Instrument < ActiveRecord::Base
  has_many :clips
  has_and_belongs_to_many :users
end
