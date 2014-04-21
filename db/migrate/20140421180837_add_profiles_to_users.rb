class AddProfilesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instructor_profile_id, :integer
    add_column :users, :student_profile_id, :integer
    add_column :users, :admin_profile_id, :integer
  end
end
