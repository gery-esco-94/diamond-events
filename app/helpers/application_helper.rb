module ApplicationHelper
	def get_email_oauth
		if session[:facebook_data]
			session[:facebook_data]["email"]
		else
			""
		end
	end
	def get_firstname_oauth
		if session[:facebook_data]
			session[:facebook_data]["firstname"]
		else
			""
		end
	end
	def get_lastname_oauth
		if session[:facebook_data]
			session[:facebook_data]["lastname"]
		else
			""
		end
	end
	def get_username_oauth
		if session[:facebook_data]
			session[:facebook_data]["username"]
		else
			""
		end
	end
	def get_country_oauth
		if session[:facebook_data]
			session[:facebook_data]["country"]
		else
			""
		end
	end
	def get_city_oauth
		if session[:facebook_data]
			session[:facebook_data]["city"]
		else
			""
		end
	end
end
