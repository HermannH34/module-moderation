class AddIsAcceptedToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :is_accepted, :boolean
  end
end
