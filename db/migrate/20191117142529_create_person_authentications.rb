class CreatePersonAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :person_authentications do |t|
      t.integer :person_id
      t.integer :authentication_provider_id
      t.string :uid
      t.string :token
      t.datetime :token_expires_at
      t.text :params
      t.timestamps
    end

    add_index :person_authentications, [:authentication_provider_id], name: "index_person_authentications_on_authentication_provider_id"
    add_index :person_authentications, [:person_id], name: "index_person_authentications_on_person_id"
  end
end
