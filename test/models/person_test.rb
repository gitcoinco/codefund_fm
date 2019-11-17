# == Schema Information
#
# Table name: people
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  bio                    :text
#  editor                 :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  github_handle          :string
#  handle                 :string
#  host                   :boolean          default(FALSE)
#  linkedin_handle        :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  twitter_handle         :string
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_people_on_email                 (email) UNIQUE
#  index_people_on_reset_password_token  (reset_password_token) UNIQUE
#

require "test_helper"

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
