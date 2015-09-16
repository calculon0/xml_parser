require 'test_helper'

class LandlordTest < ActiveSupport::TestCase
  test "parse landlord" do
    test = 
      "<agent>
         <agent-name>Pacific Listings</agent-name>
         <agent-phone>(310) 933 4191</agent-phone>
         <agent-email>info1@pacificlistings.com</agent-email>
         <agent-alternate-email>Info1@PacificListings.com</agent-alternate-email>
         <agent-picture-url />
         <agent-id />
      </agent>"
    doc = Nokogiri::XML(test)

    assert Landlord.parse_landlord(Listing.create, doc) 
  end

  test "landlord should be dedup" do
    test = 
      "<agent>
         <agent-name>Pacific Listings</agent-name>
         <agent-phone>(310) 933 4191</agent-phone>
         <agent-email>info1@pacificlistings.com</agent-email>
         <agent-alternate-email>Info1@PacificListings.com</agent-alternate-email>
         <agent-picture-url />
         <agent-id />
      </agent>"
    doc = Nokogiri::XML(test)

    total = Landlord.all.count
    Landlord.parse_landlord(Listing.create, doc) 
    Landlord.parse_landlord(Listing.create, doc) 
    
    assert_equal Landlord.all.count, total + 1
  end

  test "phone should be non-formatted" do
    test = 
      "<agent>
         <agent-name>Pacific Listings</agent-name>
         <agent-phone>(310) 933 4191</agent-phone>
         <agent-email>info1@pacificlistings.com</agent-email>
         <agent-alternate-email>Info1@PacificListings.com</agent-alternate-email>
         <agent-picture-url />
         <agent-id />
      </agent>"
    doc = Nokogiri::XML(test)

    landlord = Landlord.parse_landlord(Listing.create, doc) 
    
    assert_equal landlord.phone, "3109334191"
  end  
end