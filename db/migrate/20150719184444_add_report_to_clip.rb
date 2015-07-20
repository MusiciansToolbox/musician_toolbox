class AddReportToClip < ActiveRecord::Migration
  def change
    add_column :clips, :reported, :boolean
  end
end
