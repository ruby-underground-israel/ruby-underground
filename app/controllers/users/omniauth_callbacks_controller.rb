class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    env = request.env["omniauth.auth"]
    @user = User.find_for_twitter(env, current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      env.delete("extra")
      session["devise.twitter_data"] = env
      redirect_to new_user_registration_url
    end
  end
end
