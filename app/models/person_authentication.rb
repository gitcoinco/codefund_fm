# == Schema Information
#
# Table name: person_authentications
#
#  id                         :bigint           not null, primary key
#  params                     :text
#  token                      :string
#  token_expires_at           :datetime
#  uid                        :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  authentication_provider_id :integer
#  person_id                  :integer
#
# Indexes
#
#  index_person_authentications_on_authentication_provider_id  (authentication_provider_id)
#  index_person_authentications_on_person_id                   (person_id)
#

class PersonAuthentication < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................

  # relationships .............................................................
  belongs_to :authentication_provider
  belongs_to :person

  # validations ...............................................................
  # callbacks .................................................................
  # scopes ....................................................................

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  serialize :params

  # class methods .............................................................
  class << self
    def create_from_omniauth(params, person, provider)
      token_expires_at = params["credentials"]["expires_at"] ? Time.at(params["credentials"]["expires_at"]).to_datetime : nil
      create(
        person: person,
        authentication_provider: provider,
        uid: params["uid"],
        token: params["credentials"]["token"],
        token_expires_at: token_expires_at,
        params: params,
      )
    end
  end

  # public instance methods ...................................................

  # protected instance methods ................................................

  # private instance methods ..................................................
end
