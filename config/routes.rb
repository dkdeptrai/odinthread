# frozen_string_literal: true

Rails.application.routes.draw do
	get 'profiles/show'
	get 'profiles/edit'
	devise_for :users
	# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

	# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
	# Can be used by load balancers and uptime monitors to verify that the app is live.
	get 'up' => 'rails/health#show', as: :rails_health_check

	# Defines the root path route ("/")
	resources :posts do
		get 'show', to: 'posts#show', as: 'show'
		resources :likes

	end

	resources :users do
		resources :profiles, only: %i[show edit update] do
			member do
				post 'follow', to: 'profiles#follow', as: 'follow'
				delete 'unfollow', to: 'profiles#unfollow', as: 'unfollow'
			end
		end
	end
	resources :comments

	root 'posts#index'

end
