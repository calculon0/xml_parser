class PagesController < ApplicationController
  def index
  end

  def parse
    f = File.open('code_challenge_listings.xml')
    doc = Nokogiri::XML(f)
    doc.xpath('//properties/property').each do |p|
      Listing.parse(p)
    end
  end
end
