class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :password
      t.date :birthday
      t.string :email

      # the following is the same as t.timestamps
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
