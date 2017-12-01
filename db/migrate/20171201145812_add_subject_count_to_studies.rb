class AddSubjectCountToStudies < ActiveRecord::Migration[5.0]
  def change
    add_column :studies, :subjects_count, :integer
  end
end
