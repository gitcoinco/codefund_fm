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

require "test_helper"

class SocialAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
