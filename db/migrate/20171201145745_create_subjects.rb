class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :firstname
      t.string :lastname
      t.integer :study_id

      t.timestamps

    end
  end
end
