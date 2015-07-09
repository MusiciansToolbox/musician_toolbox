class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :clips

  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :genres

  has_secure_password

  accepts_nested_attributes_for :instruments, reject_if: proc { |attributes| attributes['name'].blank? }

  accepts_nested_attributes_for :genres
end
