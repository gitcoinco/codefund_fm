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

require "test_helper"

class PersonAuthenticationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
