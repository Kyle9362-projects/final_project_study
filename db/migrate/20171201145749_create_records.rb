class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :datetime
      t.text :data
      t.integer :subject_id
      t.integer :data_type_id

      t.timestamps

    end
  end
end
