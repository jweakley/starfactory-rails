class AddCostInCentsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :cost_in_cents, :integer, default: 0
  end
end
