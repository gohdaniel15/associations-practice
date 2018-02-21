class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, references: :users
      t.references :followed, null: false, references: :users

      t.timestamps
    end

    add_foreign_key :relationships, :users, column: :follower_id
    add_foreign_key :relationships, :users, column: :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
