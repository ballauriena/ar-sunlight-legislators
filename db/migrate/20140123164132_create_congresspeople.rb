require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def up
    create_table :legislators do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :party
      t.string :state
      t.integer :district
      t.string :gender
      t.integer :phone
      t.integer :fax
      t.string :website
      t.string :webform
      t.string :congress_office
      t.string :twitter_id
      t.date :birthdate

      t.timestamps
    end
  end

  def down
    drop_table :legislators
  end

end
