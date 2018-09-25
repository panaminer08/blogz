class CreateTheTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.datetime :created_at
    end
  end
end
