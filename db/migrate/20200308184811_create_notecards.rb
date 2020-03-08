class CreateNotecards < ActiveRecord::Migration
  def change
    create_table :notecards do |t|

      t.timestamps null: false
    end
  end
end
