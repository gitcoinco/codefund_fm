class CreateSocialAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :social_accounts do |t|
      t.string :token
      t.string :secret
      t.references :person, foreign_key: true
      t.references :authentication_provider, foreign_key: true

      t.timestamps
    end
  end
end
