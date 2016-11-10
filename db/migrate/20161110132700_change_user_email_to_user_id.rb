class ChangeUserEmailToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :user_email, :user_id
    change_column :comments, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
