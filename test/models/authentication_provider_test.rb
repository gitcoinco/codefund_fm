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

require "test_helper"

class AuthenticationProviderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
