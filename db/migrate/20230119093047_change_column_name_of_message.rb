class ChangeColumnNameOfMessage < ActiveRecord::Migration[7.0]
  def change
    rename_column :messages, :message, :comment
  end
end
