class AddActivatedColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activated, :boolean

    User.update_all(activated: true)

    change_column :users, :activated, :boolean, default: false, null: false
  end
end
