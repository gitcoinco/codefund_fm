# == Schema Information
#
# Table name: authentication_providers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authentication_providers_on_name  (name)
#

class AuthenticationProvider < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................

  # relationships .............................................................
  has_many :social_accounts
  has_many :people
  has_many :person_authentications

  # validations ...............................................................
  # callbacks .................................................................

  # scopes ....................................................................
  scope :get_provider_name, -> (provider_name) {where("name = ?", provider_name)}

  # additional config (i.e. accepts_nested_attribute_for etc...) ..............

  # class methods .............................................................
  class << self
  end

  # public instance methods ...................................................

  # protected instance methods ................................................

  # private instance methods ..................................................
end
