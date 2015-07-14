class AddJamCircleIdAndPreviousClipIdToClips < ActiveRecord::Migration
  def change
    add_reference :clips, :jam_circle, index: true, foreign_key: true
    add_column :clips, :previous_clip_id, :integer
  end
end
