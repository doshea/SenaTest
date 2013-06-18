class CreateChambers < ActiveRecord::Migration
  def change
    create_table :chambers do |t|
      t.string :name
      t.string :short_name
      t.string :male_title
      t.string :female_title
      t.string :neuter_title

      t.timestamps
    end
  end
end
