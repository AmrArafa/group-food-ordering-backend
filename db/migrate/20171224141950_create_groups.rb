class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
        t.datetime :time_frame

        t.belongs_to :creator, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
