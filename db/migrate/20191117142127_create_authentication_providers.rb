class CreateAuthenticationProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :authentication_providers do |t|
      t.string :name
      t.index :name
      t.timestamps
    end
    AuthenticationProvider.create(name: "github")
    AuthenticationProvider.create(name: "twitter")
    AuthenticationProvider.create(name: "linkedin")
  end
end
