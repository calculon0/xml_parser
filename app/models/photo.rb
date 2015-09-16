class Photo < ActiveRecord::Base
  belongs_to :listing

  def self.parse_photos(listing, property)
    return nil if listing.nil?
    
    property.css('picture').each do |p|
      listing.photos.create(url: p.css('picture-url').text)
    end
  end
end