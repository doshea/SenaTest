class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :adjective
      t.string :member_noun

      t.timestamps
    end
  end
end
