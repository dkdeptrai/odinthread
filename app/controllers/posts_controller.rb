# frozen_string_literal: true

class PostsController < ApplicationController
	def index
		@posts = Post.all
		@post = Post.new
	end

	def show
		# @post = Post.find(params[:id])
	end

	def create
		@post = Post.create!(post_params)
		redirect_to @post
	end

	private

	def post_params
		params.require(:post).permit(:author_id, :content)
	end
end
