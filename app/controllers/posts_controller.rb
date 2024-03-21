# frozen_string_literal: true

class PostsController < ApplicationController
	before_action :set_current_user

	def index
		@posts = Post.all.sort_by(&:created_at).reverse
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments.reverse
	end

	def create
		@post = Post.create!(post_params)
	end

	private

	def post_params
		params.require(:post).permit(:author_id, :content)
	end

	def set_current_user
		@current_user = current_user
	end
end
