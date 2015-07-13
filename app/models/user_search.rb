class UserSearch < ActiveRecord::Base
  belongs_to :user

  def self.find_nearby_zipcodes(zipcode, radius)
    response = HTTParty.get("https://www.zipwise.com/webservices/radius.php?key=#{ENV['ZIP_CODE_API_KEY']}&zip=#{zipcode}&radius=#{radius.to_i}&format=json")
    p "Response: #{response}"
    parsed = response.parsed_response
    zipcodes = []
    parsed["results"].each do |i|
      zipcodes << i["zip"]
    end
    p "Zipcodes: #{zipcodes}"
    return zipcodes
  end

  def self.search_musicians(zipcodes, genre_id, instrument_id)
    local_users = []
    zipcodes.each do |zipcode|
      if zipcode == nil
        return nil
      elsif genre_id == nil && instrument_id == nil
        local_users << User.where(zipcode: zipcode).to_a
      elsif genre_id == nil
        local_users << User.where(zipcode: zipcode).joins(:instruments).where(instruments: {id: instrument_id})
      elsif instrument_id == nil
        local_users << User.where(zipcode: zipcode).joins(:genres).where(genres: {id: genre_id})
      else
        local_users << User.where(zipcode: zipcode).joins(:instruments).where(instruments: {id: instrument_id}).joins(:genres).where(genres: {id: genre_id})
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
    end
    p local_users.flatten
    local_users.flatten
  end
end
