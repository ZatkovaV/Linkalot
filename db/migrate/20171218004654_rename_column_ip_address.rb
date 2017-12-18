class RenameColumnIpAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :votes, :ip_address, :student_id
  end
end
