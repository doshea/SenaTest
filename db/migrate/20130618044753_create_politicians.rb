class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nickname
      t.string :name_suffix

      t.string :gender
      t.date :birthday

      t.boolean :seniority
      t.boolean :in_office
      t.integer :senate_class

      t.integer :govtrack_id

      t.belongs_to :state
      t.belongs_to :chamber
      t.belongs_to :party

      t.text :image

      t.timestamps
    end
  end
end
