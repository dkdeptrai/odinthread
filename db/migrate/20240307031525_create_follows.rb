# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.boolean :is_accepted

      t.timestamps
    end
  end
end
