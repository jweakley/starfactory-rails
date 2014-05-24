class AddVotesGoalToWorkshops < ActiveRecord::Migration
  def change
    add_column :workshops, :votes_goal, :integer, default: 0
  end
end
