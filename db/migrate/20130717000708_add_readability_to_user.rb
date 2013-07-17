class AddReadabilityToUser < ActiveRecord::Migration
  def change
    add_column :users, :readability_oauth_token, :string
    add_column :users, :readability_oauth_secret, :string
    add_column :users, :readability_handle, :string
  end
end
