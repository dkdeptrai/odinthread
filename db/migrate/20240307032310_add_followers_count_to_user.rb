# frozen_string_literal: true

class AddFollowersCountToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :followers_count, :integer, default: 0
  end
end
