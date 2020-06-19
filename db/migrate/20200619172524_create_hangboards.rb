class CreateHangboards < ActiveRecord::Migration[6.0]
  def change
    create_table :hangboards do |t|
      t.integer :weight
      t.integer :user_id
      t.datetime :date

      t.timestamps
    end
  end
end
