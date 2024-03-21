class CommentsController < ApplicationController
	before_action :set_post

	def create
		comment = Comment.new(comment_params)
		comment.user_id = current_user.id
		@comment = Comment.create!(user_id: comment.user_id, post_id: comment.post_id, content: comment.content)
	end

	private

	def comment_params
		params.require(:comment).permit(:post_id, :content)
	end

	def set_post
		@post = Post.find(params[:comment][:post_id])
	end
end
