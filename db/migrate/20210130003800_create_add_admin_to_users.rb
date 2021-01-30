class CreateAddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :add_admin_to_users do |t|

      t.timestamps
    end
  end
end
