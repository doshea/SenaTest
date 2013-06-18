class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nickname
      t.belongs_to :state
      t.boolean :in_office
      t.string :gender
      t.integer :senate_class
      t.date :birthday
      t.integer :govtrack_id
      t.boolean :seniority
      t.string :name_suffix

      t.timestamps
    end
  end
end
