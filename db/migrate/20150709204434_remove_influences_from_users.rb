class RemoveInfluencesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :influences, :text
  end
end
