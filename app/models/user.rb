class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :instruments
  has_many :genres
  has_many :influences
  accepts_nested_attributes_for :instruments
  accepts_nested_attributes_for :influences
  accepts_nested_attributes_for :genres

end
