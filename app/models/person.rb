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

class Person < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  include OmniauthAttributesConcern

  # relationships .............................................................
  has_many :person_authentications

  # validations ...............................................................
  validates :email, presence: true
  validates :encrypted_password, presence: true

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config (i.e. accepts_nested_attribute_for etc...) ..............

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :omniauthable

  # class methods .............................................................
  class << self
    def create_from_omniauth(params)
      send(params.provider, params)
    end
  end

  # public instance methods ...................................................

  # protected instance methods ................................................

  # private instance methods ..................................................
end
