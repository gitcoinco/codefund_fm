module OmniConcern
  extend ActiveSupport::Concern

  def create
    auth_params = request.env["omniauth.auth"]
    provider = AuthenticationProvider.get_provider_name(auth_params.try(:provider)).first
    authentication = provider.person_authentications.where(uid: auth_params.uid).first
    existing_person = Person.where("email = ?", auth_params["info"]["email"]).try(:first)

    if person_signed_in?
      SocialAccount.get_provider_account(current_person.id, provider.id)
        .person_or_create(
          person_id: current_person.id,
          authentication_provider_id: provider.id,
          token: auth_params.try(:[], "credentials").try(:[], "token"),
          secret: auth_params.try(:[], "credentials").try(:[], "secret")
        )
      redirect_to new_person_registration_url
    elsif authentication
      create_authentication_and_sign_in(auth_params, existing_person, provider)
    else
      create_person_and_authentication_and_sign_in(auth_params, provider)
    end
  end

  def sign_in_with_existing_authentication(authentication)
    sign_in_and_redirect(:person, authentication.person)
  end

  def create_authentication_and_sign_in(auth_params, person, provider)
    PersonAuthentication.create_from_omniauth(auth_params, person, provider)
    sign_in_and_redirect(:person, person)
  end

  def create_person_and_authentication_and_sign_in(auth_params, provider)
    person = Person.create_from_omniauth(auth_params)
    if person.valid?
      create_authentication_and_sign_in(auth_params, person, provider)
    else
      flash[:error] = person.errors.full_messages.first
      redirect_to new_person_registration_url
    end
  end
end
