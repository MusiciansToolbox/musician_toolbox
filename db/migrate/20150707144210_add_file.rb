class AddFile < ActiveRecord::Migration
  def change
    add_attachment :clips, :uploaded_file
  end
end
