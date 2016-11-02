class ChangeUserIdToUserEmailForComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :user_id, :user_email
    change_column :comments, :user_email, :string
  end
end
