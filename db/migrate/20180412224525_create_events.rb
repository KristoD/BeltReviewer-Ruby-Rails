class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :city
      t.string :state
      t.integer :user_id
      t.references :user
      t.timestamps null: false
    end
  end
end
