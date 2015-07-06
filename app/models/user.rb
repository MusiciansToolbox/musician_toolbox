class User < ActiveRecord::Base
  has_secure_password
  has_many :instruments
  has_many :genres
  has_many :influences
end
