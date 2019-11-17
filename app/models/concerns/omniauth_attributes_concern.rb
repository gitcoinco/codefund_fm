module OmniauthAttributesConcern
  extend ActiveSupport::Concern

  module ClassMethods
    def twitter(params)
      if params["info"]["email"].blank?
        params["info"]["email"] = "dummy#{SecureRandom.hex(10)}@dummy.com"
      end

      attributes = {
        email: params["info"]["email"],
        name: params["info"]["name"],
        twitter_handle: params["info"]["nickname"],
        password: Devise.friendly_token,
      }
      create(attributes)
    end

    def github(params)
      attributes = {
        email: params["info"]["email"],
        name: params["info"]["name"],
        handle: params["info"]["nickname"],
        github_handle: params["info"]["nickname"],
        password: Devise.friendly_token,
      }
      create(attributes)
    end

    def linkedin(params)
      attributes = {
        email: params["info"]["email"],
        name: params["info"]["name"],
        linkedin_handle: params["info"]["nickname"],
        password: Devise.friendly_token,
      }
      create(attributes)
    end
  end
end
