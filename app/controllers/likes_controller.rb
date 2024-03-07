# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.save
    redirect_to post_path(@like.post)
  end

  private

  def like_params
    params.require(:like).permit(:user, :post)
  end
end
