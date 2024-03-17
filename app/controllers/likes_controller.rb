class LikesController < ApplicationController
	before_action :set_post
	before_action :set_like, only: %i[destroy]

	def create
		@post.likes.create(user: current_user)
		@post.increment! :likes_count
		@post.touch

		# redirect_to @post
	end

	def destroy
		@like.destroy
		@post.decrement! :likes_count
		@post.touch
		# redirect_to @post
	end

	private

	def set_post
		@post = Post.find_by(id: params[:post_id])
	end

	def set_like
		@like = @post.likes.find_by(user: current_user, post: @post)
	end
end
