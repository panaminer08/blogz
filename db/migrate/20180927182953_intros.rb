class Intros < ActiveRecord::Migration[5.2]
  def change
      create_table :intros do |t|
        t.string :title
        t.string :content
        t.references :user
        t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
