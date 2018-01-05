class ChangeColDefault < ActiveRecord::Migration[5.1]
  def change
  	change_column_default(:orders, :user_id, nil)
  end
end
