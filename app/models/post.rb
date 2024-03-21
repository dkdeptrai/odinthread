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
	validates :content, presence: true
	has_many :likes
	has_many :comments, dependent: :destroy

	after_commit :update_posts, on: [:create, :destroy]
	after_commit :update_likes_count, on: :update

	def update_posts

		broadcast_prepend_to 'posts', partial: 'posts/post', locals: { post: self }, target: 'posts'
	end

	def update_likes_count
		puts "update_likes_count!!!"
		broadcast_replace_to 'posts'
	end

	def liked_by?(user)
		likes.exists?(user: user, post: self)
	end
end
