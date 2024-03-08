# frozen_string_literal: true

class ProfilesController < ApplicationController
	before_action :set_profile, only: %i[show edit update]
	before_action :correct_user, only: %i[edit update]

	def show
		@user = @profile.user
		@follow = Follow.find_by(user_id: @user.id, follower_id: current_user.id)
		@posts = Post.where(author_id: @user.id)
	end

	def edit

	end

	def update
		if @profile.update(profile_params)
			redirect_to user_profile_path(@profile.user, @profile), notice: 'Profile updated'
		else
			render :edit
		end
	end

	def follow
		if Follow.create!(user_id: @profile.user_id, follower_id: current_user.id, is_accepted: false)
			flash[:notice] = 'Follow requested sent'
		end

		redirect_to user_profile_path(@profile.user, @profile)
	end

	def unfollow
		@follow = Follow.find_by(user_id: @profile.user_id, follower_id: current_user.id)
		flash[:notice] = 'Unfollowed' if @follow.destroy

		redirect_to user_profile_path(@profile.user, @profile)
	end

	private

	def set_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:bio, :avatar, :name)
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless @user == current_user
	end
end
