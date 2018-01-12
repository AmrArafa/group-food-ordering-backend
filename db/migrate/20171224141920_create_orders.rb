class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
        t.boolean :paid, default: false
        t.boolean :delivered, default: false
        t.integer :user_id

        # t.belongs_to :user
        t.belongs_to :group

      t.timestamps
    end
  end
end
