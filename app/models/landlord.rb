class Landlord < ActiveRecord::Base
  has_many :listings

  def self.parse_landlord(listing, property)
    phone = property.css('agent-phone').text.gsub(/\D/, '')
    email = property.css('agent-email').text

    listing.update_attribute(:landlord, Landlord.find_or_create_by(phone: phone, email: email) )
    listing.landlord
  end
end