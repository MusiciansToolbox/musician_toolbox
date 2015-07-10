class UserSearch < ActiveRecord::Base
  belongs_to :user

  def self.search_musicians(zipcode, genre_id, instrument_id)
    if zipcode == nil
      return nil
    elsif genre_id == nil && instrument_id == nil
      local_users = local_users = User.where(zipcode: zipcode)
    elsif genre_id == nil
      local_users = User.where(zipcode: zipcode).joins(:instruments).where(instruments: {id: instrument_id})
    elsif instrument_id == nil
      local_users = User.where(zipcode: zipcode).joins(:genres).where(genres: {id: genre_id})
    else
      local_users = User.where(zipcode: zipcode).joins(:instruments).where(instruments: {id: instrument_id}).joins(:genres).where(genres: {id: genre_id})
    # instrument_matches = local_users.select do |user|
    #   user.instruments.any? do |instrument|
    #     instrument.id == instrument_id
    #   end
    # end
    # exact_matches = instrument_matches.select do |user|
    #   user.genres.any? do |genre|
    #     genre.id == genre_id
    #   end
    # end
    # return exact_matches
    end
    users = []
    local_users.each do |user|
      users << user
    end
    return users
  end
end
