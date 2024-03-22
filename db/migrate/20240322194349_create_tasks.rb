class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name, limit: 255

      t.timestamps
    end
  end
end
