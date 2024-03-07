# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :bio
      t.string :avatar

      t.timestamps
    end
  end
end
