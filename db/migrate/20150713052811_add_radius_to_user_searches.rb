class AddRadiusToUserSearches < ActiveRecord::Migration
  def change
    add_column :user_searches, :radius, :float
  end
end
