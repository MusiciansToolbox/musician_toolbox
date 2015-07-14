class RemoveResultsFromUserSearch < ActiveRecord::Migration
  def change
    remove_column :user_searches, :results, :text
  end
end
