class AddActivationTokenColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activation_token, :string

    User.all.each do |user|
      user.update(activation_token: SecureRandom.urlsafe_base64)
    end

    change_column :users, :activation_token, :string, null: false

    add_index :users, :activation_token, unique: true
  end
end
