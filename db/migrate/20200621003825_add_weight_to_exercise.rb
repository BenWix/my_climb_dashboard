class AddWeightToExercise < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :weight, :integer
  end
end
