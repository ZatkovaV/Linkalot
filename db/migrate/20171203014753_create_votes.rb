class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :link_id
      t.string :ip_address

      t.timestamps
    end
  end
end

