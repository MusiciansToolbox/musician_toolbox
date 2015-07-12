class AddTitleToClips < ActiveRecord::Migration
  def change
    add_column :clips, :title, :string
  end
end
