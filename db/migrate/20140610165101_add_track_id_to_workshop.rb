class AddTrackIdToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :track_id, :integer
    add_index :workshops, :track_id
  end
end
