# frozen_string_literal: true

class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.create!(post_params)
		redirect_to posts_path
	end

	def like
		@post = Post.find(params[:id])
		@post.increment!(:likes_count, 1)

		Like.create!(user_id: current_user.id, post_id: @post.id)
		redirect_to posts_path
	end

	def unlike
		@post = Post.find(params[:id])
		Like.find_by(user_id: current_user.id, post_id: @post.id).destroy
		@post.decrement!(:likes_count, 1)
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:author_id, :content)
	end
end
