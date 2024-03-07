# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id          :integer          not null, primary key
#  is_accepted :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follower_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_follows_on_follower_id  (follower_id)
#  index_follows_on_user_id      (user_id)
#
# Foreign Keys
#
#  follower_id  (follower_id => users.id)
#  user_id      (user_id => users.id)
#
require 'test_helper'

class FollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
