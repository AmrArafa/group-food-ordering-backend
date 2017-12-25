class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
        t.string :name, null: false
        t.string :image
        t.decimal :price, null: false
      t.timestamps
    end
  end
end
