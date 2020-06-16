class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.integer :user_id
      t.integer :climb_id
      t.integer :attempts
      t.string :description

      t.timestamps
    end
  end
end
