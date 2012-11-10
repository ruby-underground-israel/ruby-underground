class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :first_name, :last_name, :twitter_nickname, :meetup_user_id
  # attr_accessible :title, :body

  class << self
    def new_with_session(params, session)
      super.tap do |user|
        # refactor this
        if data = session["devise.twitter_data"] && session["devise.twitter_data"]["info"]
          user.email = data["email"] if user.email.blank?
          user.first_name, user.last_name = data["name"].split(" ")
          user.twitter_nickname = data["nickname"]
        elsif data = session["devise.meetup_data"] && session["devise.meetup_data"]["info"]
          user.email = data["email"] if user.email.blank?
          user.first_name, user.last_name = data["name"].split(" ")
          user.meetup_user_id = data["id"]
        end
      end
    end

    def find_for_twitter(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:twitter_nickname => data["nickname"]).first

      unless user
        first_name, last_name = data["name"].split(" ")
        user = User.create(first_name: first_name,
                           last_name: last_name,
                           twitter_nickname: data["nickname"],
                           password: Devise.friendly_token[0,20]
                          )
      end
      user
    end
    
    def find_for_meetup(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:meetup_user_id => data["id"]).first

      unless user
        first_name, last_name = data["name"].split(" ")
        user = User.create(meetup_user_id: data["id"],
                           first_name: first_name,
                           last_name: last_name,
                           password: Devise.friendly_token[0,20]
                          )
      end
      user
    end
  end

  def name
    "#{first_name} #{last_name}" || email || twitter_nickname
  end
end
