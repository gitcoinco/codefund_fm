# == Schema Information
#
# Table name: social_accounts
#
#  id                         :bigint           not null, primary key
#  secret                     :string
#  token                      :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  authentication_provider_id :bigint
#  person_id                  :bigint
#
# Indexes
#
#  index_social_accounts_on_authentication_provider_id  (authentication_provider_id)
#  index_social_accounts_on_person_id                   (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (authentication_provider_id => authentication_providers.id)
#  fk_rails_...  (person_id => people.id)
#

class SocialAccount < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................

  # relationships .............................................................
  belongs_to :authentication_provider
  belongs_to :person

  # validations ...............................................................
  # callbacks .................................................................

  # scopes ....................................................................
  scope :get_provider_account, -> (person_id, auth_provider_id) {
    where("person_id = ? and authentication_provider_id = ?", person_id,auth_provider_id)
  }

  scope :get_provider_name_account, -> (person_id,auth_provider_name) {
    where("person_id = ? and authentication_providers.name = ?", person_id, auth_provider_name)
    .joins(:authentication_provider)
  }

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............

  # class methods .............................................................
  class << self
  end

  # public instance methods ...................................................

  # protected instance methods ................................................

  # private instance methods ..................................................
end
