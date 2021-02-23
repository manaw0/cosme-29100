class CreateSnsCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :sns_credentials do |t|
      t.string :provider
      t.string :uid
      t.string :user,     foreign_key: true
      t.timestamps
    end
  end
end
