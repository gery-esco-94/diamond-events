class OmniauthCallbacksController < ApplicationController
	def facebook
		auth = request.env["omniauth.auth"]
		data = {
      		firstname: auth.info.first_name,
      		lastname: auth.info.last_name,
      		email: auth.info.email,
      		username: auth.info.nickname,
      		city: auth.info.city,
      		country: auth.info.country,
      		provider: auth.provider,
      		uid: auth.uid,
      		locale: auth.extra.raw_info.locale,
      		verified: auth.extra.raw_info.verified
		}

		@usuario = Usuario.find_or_create_by_omniauth(data)

		if @usuario.persisted?
			sign_in_and_redirect @usuario, event: :authentication, locale: "es"
		else
			session[:omniauth_errors] = @usuario.errors.full_messages.to_sentence unless @usuario.save

			session[:facebook_data] = data

			redirect_to new_usuario_registration_url
		end
	end
end