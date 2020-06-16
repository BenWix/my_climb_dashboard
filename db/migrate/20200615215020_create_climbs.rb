class CreateClimbs < ActiveRecord::Migration[6.0]
  def change
    create_table :climbs do |t|
      t.string :name
      t.string :grade
      t.string :climb_style

      t.timestamps
    end
  end
end
