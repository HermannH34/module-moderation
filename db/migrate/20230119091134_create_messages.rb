class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :username
      t.datetime :date
      t.text :message

      t.timestamps
    end
  end
end
