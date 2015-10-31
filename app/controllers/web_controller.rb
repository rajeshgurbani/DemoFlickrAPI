class WebController < ApplicationController

	def home
		@public_feed = APIBaseService.public_api_service(FlickerAPIService::API_TYPE_FLICKR_PUBLIC)
	end

	def user_feed
		@user_feed = APIBaseService.user_api_service(FlickerAPIService::API_TYPE_FLICKR_PUBLIC, params[:id])
	end

	def user_friend_feed
		@user_friend_feed = APIBaseService.user_friend_api_service(FlickerAPIService::API_TYPE_FLICKR_FRIEND, params[:id])
	end

end
