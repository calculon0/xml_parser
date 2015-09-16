class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :landlord_id
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.string  :latitude
      t.string  :longitude
      t.string  :street
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.integer :price
      t.string  :listing_source_url
      t.string  :listing_id
      t.string  :title
      t.text    :description
    end
  end
end
