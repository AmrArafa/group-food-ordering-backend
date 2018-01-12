class RenameColumnPaidToPaidOnline < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :paid, :paid_online
  end
end
