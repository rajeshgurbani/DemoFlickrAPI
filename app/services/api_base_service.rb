class APIBaseService
	FLICKR_PUBLIC_URL = "http://api.flickr.com/services/feeds/photos_public.gne"
	FLICKR_USER_FRIEND_URL = "http://api.flickr.com/services/feeds/photos_friends.gne"

	# API Types
	
	# API_TYPE = [[FLICKRURL, FlickerAPIService::API_TYPE_FLICKR]]

	def APIBaseService.public_api_service(api_type)
	case api_type
    when FlickerAPIService::API_TYPE_FLICKR_PUBLIC
    	FlickerAPIService.get_public_data_by_url(FLICKR_PUBLIC_URL)
    else
      raise "API Service is not implemented for the API_TYPE #{api_type}"
    end
	end

	def APIBaseService.user_api_service(api_type, query_string)
	case api_type
    when FlickerAPIService::API_TYPE_FLICKR_PUBLIC
    	FlickerAPIService.get_user_data_by_url(FLICKR_PUBLIC_URL, query_string)
    else
      raise "API Service is not implemented for the API_TYPE #{api_type}"
    end
	end

	def APIBaseService.user_friend_api_service(api_type, query_string)
	case api_type
    when FlickerAPIService::API_TYPE_FLICKR_FRIEND
    	FlickerAPIService.get_user_friend_data_by_url(FLICKR_USER_FRIEND_URL, query_string)
    else
      raise "API Service is not implemented for the API_TYPE #{api_type}"
    end
	end

end