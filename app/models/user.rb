class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :clips
  has_many :instruments
  has_many :genres
  has_secure_password
  accepts_nested_attributes_for :instruments
  accepts_nested_attributes_for :genres
end
