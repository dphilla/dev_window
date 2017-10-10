class ChangeUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :ouath_token, :oauth_token
  end
end
