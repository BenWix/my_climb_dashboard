class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :hangboard_id
      t.string :hold
      t.integer :reps
      t.integer :difficulty

      t.timestamps
    end
  end
end
