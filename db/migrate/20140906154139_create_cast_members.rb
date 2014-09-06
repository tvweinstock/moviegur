class CreateCastMembers < ActiveRecord::Migration
  def change
    create_table :cast_members do |t|
      t.string :name
      t.string :role
      t.references :movie, index: true

      t.timestamps
    end
  end
end
