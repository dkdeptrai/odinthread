# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  avatar     :string
#  bio        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user
end
