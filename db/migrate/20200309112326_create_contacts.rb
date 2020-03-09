class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :mail
      t.integer :phone
      t.text :content

      t.timestamps
    end
  end
end
