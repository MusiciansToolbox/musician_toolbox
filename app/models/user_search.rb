class UserSearch < ActiveRecord::Base
  belongs_to :user

  def self.search_musicians(zipcode, genre_id, instrument_id)
    local_users = User.where(zipcode:zipcode)
    exact_matches = local_users.select do |user|
      user.instruments.any? do |instrument|
        instrument.id == instrument_id
      end
      # && user.genres.any? do |genre|
      #   genre.id == genre_id
      # end
    end
    return exact_matches
  end
end
