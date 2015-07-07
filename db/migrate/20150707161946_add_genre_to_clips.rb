class AddGenreToClips < ActiveRecord::Migration
  def change
    add_column :clips, :genre, :string
  end
end
