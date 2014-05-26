class AddVotesCountToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :votes_count, :integer, default: 0
  end
end
