class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :body
      t.string :emotion
      t.integer :user_id
      t.timestamps
    end
  end
end
