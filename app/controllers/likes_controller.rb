class LikesController < ApplicationController
	before_action :set_post
	before_action :set_like, only: %i[destroy]

	def create
		@post.increment! :likes_count
		@post.likes.create(user: current_user)
		redirect_to @post
	end

	def destroy
		@post.decrement! :likes_count
		@like.destroy
		redirect_to @post
	end

	private

	def set_post
		@post = Post.find_by(id: params[:post_id])
	end

	def set_like
		@like = @post.likes.find_by(user: current_user, post: @post)
	end
end
