class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :email, :password, presence: true

  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
   		:trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    	user.email = auth.info.email
    	user.password = Devise.friendly_token[0,20]
    	#user.name = auth.info.name   # assuming the user model has a name
    	#user.image = auth.info.image # assuming the user model has an image
  	  end
  end

end
