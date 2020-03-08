class CreateNotecards < ActiveRecord::Migration
  def change
    create_table :notecards do |t|
      t.string :concept
      t.string :definition
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
