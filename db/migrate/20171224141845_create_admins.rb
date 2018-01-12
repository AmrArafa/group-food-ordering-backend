class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
        t.string :first_name
        t.string :last_name
        t.string :email, null: false
        t.string :password_digest
        t.string :invitation_token
        t.datetime :invited_at

      t.timestamps
    end
  end
end
