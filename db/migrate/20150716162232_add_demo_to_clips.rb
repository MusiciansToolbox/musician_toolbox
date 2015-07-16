class AddDemoToClips < ActiveRecord::Migration
  def change
    add_column :clips, :demo, :boolean
  end
end
