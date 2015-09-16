class Listing < ActiveRecord::Base
  belongs_to  :landlord
  has_many    :photos

  def self.parse(property)
    return if property.css('picture').count < 3

    street = property.css('street-address').text
    city = property.css('city-name').text
    state = property.css('state-code').text
    zipcode = property.css('zipcode').text
    listing_source_url = property.css('lp-url').text

    listing = get_listing(listing_source_url, street, city, state, zipcode)

    Photo.parse_photos(listing, property)
    Landlord.parse_landlord(listing, property)

    listing.bathroom_count = property.css('num-bathrooms').text
    listing.bedroom_count = property.css('num-bedrooms').text
    listing.longitude = property.css('longitude').text
    listing.latitude = property.css('latitude').text
    listing.price = property.css('price').text
    listing.listing_id = property.css('provider-listingid').text
    listing.title = property.css('listing-title').text
    listing.description = property.css('description').text
    listing.save
  end

  def self.get_listing(listing_source_url, street, city, state, zipcode)
    listing = listing_source_url.nil? ? nil : Listing.find_by(listing_source_url: listing_source_url)
    listing = Listing.find_by(street: street, city: city, state: state, zipcode: zipcode) if listing.nil? && !street.nil? && !city.nil? && !state.nil? && !zipcode.nil?
    listing = Listing.create(listing_source_url: listing_source_url, street: street, city: city, state: state, zipcode: zipcode) if listing.nil?
    listing
  end
end