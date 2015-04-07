class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :birthday

  def self.find_or_create_by_omniauth(auth)
  	usuario = Usuario.where(provider: auth[:provider], uid: auth[:uid]).first
  	unless usuario
  		usuario = Usuario.create(
  			firstname: auth[:firstname],
  			lastname: auth[:lastname],
  			username: auth[:username],
  			email: auth[:email],
  			uid: auth[:uid],
  			provider: auth[:provider],
  			password: Devise.friendly_token[0,20]
  		)
  	else
  		usuario = usuario
  	end
  end
end