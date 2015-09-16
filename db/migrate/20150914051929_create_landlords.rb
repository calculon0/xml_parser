class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :email
      t.string :phone
    end
  end
end
