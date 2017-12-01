class AddStudyCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :studies_count, :integer
  end
end
