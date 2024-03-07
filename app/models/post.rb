# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  content     :string
#  likes_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer          not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => users.id)
#
class Post < ApplicationRecord
	belongs_to :author, class_name: 'User'
	has_many :likes

	def liked_by?(user)
		likes.exists?(user: user)
	end
end
