class CreateGenresUsers < ActiveRecord::Migration
  create_table :genres_users, id: false do |t|
    t.belongs_to :user, index: true
    t.belongs_to :genre, index: true
  end
end
