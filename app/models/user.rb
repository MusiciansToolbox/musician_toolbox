class User < ActiveRecord::Base
  has_secure_password
  has_many :instruments
  has_many :genres
  has_many :influences
  accepts_nested_attributes_for :instruments
  accepts_nested_attributes_for :influences
  accepts_nested_attributes_for :genres

end
