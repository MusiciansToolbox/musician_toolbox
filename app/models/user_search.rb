class UserSearch < ActiveRecord::Base
  belongs_to :user

  def self.search_musicians(zipcode, genre_id, instrument_id)
    local_users = User.where(zipcode:zipcode)
    p local_users
  end
end
