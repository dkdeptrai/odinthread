# frozen_string_literal: true

class ProfilesController < ApplicationController
	before_action :set_profile, only: %i[show edit update]

	def show
		@profile = Profile.find(params[:id])
		@user = @profile.user
		@follow = Follow.find_by(user_id: @user.id, follower_id: current_user.id)
	end

	def edit; end

	def update
		if @profile.update(profile_params)
			redirect_to [@profile.user, @profile], notice: 'Profile updated'
		else
			render :edit
		end
	end

	def follow
		@profile = Profile.find(params[:id])
		if Follow.create!(user_id: @profile.user_id, follower_id: current_user.id, is_accepted: false)
			flash[:notice] = 'Follow requested sent'
		end

		redirect_to user_profile_path(@profile.user, @profile)
	end

	def unfollow
		@profile = Profile.find(params[:id])
		@follow = Follow.find_by(user_id: @profile.user_id, follower_id: current_user.id)
		if @follow.destroy
			flash[:notice] = 'Unfollowed'
		end

		redirect_to user_profile_path(@profile.user, @profile)
	end

	private

	def set_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:bio, :avatar)
	end
end
