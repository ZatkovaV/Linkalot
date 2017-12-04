class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :links, :studygroup_id, :study_group_id
  end
end
