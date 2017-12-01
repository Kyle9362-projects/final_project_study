class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.integer :user_id
      t.string :title
      t.integer :datatype_id

      t.timestamps

    end
  end
end
