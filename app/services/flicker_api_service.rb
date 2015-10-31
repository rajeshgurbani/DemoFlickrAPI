require 'simple_http'
require 'xmlsimple'

class FlickerAPIService < APIBaseService
	
	API_TYPE_FLICKR_PUBLIC = 1
	API_TYPE_FLICKR_FRIEND = 2

	def FlickerAPIService.get_public_data_by_url(url)
		FlickerAPIService.get_data_by_url(url)
	end

	def FlickerAPIService.get_user_data_by_url(url, query_string)
		url = url + "?id=" + query_string
		FlickerAPIService.get_data_by_url(url)
	end

	def FlickerAPIService.get_user_friend_data_by_url(url, query_string)
		url = url + "?user_id=" + query_string
		FlickerAPIService.get_data_by_url(url)
	end

	private
	def FlickerAPIService.get_data_by_url(url)
		begin
			xml = SimpleHttp.get url
			data = XmlSimple.xml_in(xml)
			user_feed = Hash.new
			data["entry"].each{ |d|
				id = d["id"][0]
				user_feed[id] ||= Hash.new
				user_feed[id]["content"] = d["content"]["content"]
				user_feed[id]["author"] = d["author"][0]
			}
		rescue Exception => e
			p e.message
			user_feed = nil
		end
		user_feed
	end
end