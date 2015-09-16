require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  test "parse property with less than 3 pictures" do
    test = "
      <property>
        <num-bathrooms>1</num-bathrooms>
        <num-bedrooms>1</num-bedrooms>
        <longitude>-118.3542751</longitude>
        <latitude>34.0782231</latitude>
        <street-address>228 S. Mariposa Ave.</street-address>
        <city-name>Los Angeles</city-name>
        <zipcode>90004</zipcode>
        <state-code>CA</state-code>
        <price>1150</price>
        <lp-url>http://www.pacificlistings.com/apartment-for-rent/central-la-mid-wilshire-korea-town-echo-park/pl4859/</lp-url>
        <provider-listingid>PL4857</provider-listingid>
        <listing-title>PL4856 - LUXURY RESIDENCE in PRIME Location! Spacious Split-Level Floor Plan, Real Hardwood, WandD H/U, Gorgeous Kitchen, Parking and Small Pet OK!</listing-title>
        <description><![CDATA[2 BEDROOMS + 2 BATHROOMS<br />
          PRIME Beverly Hills Location<br />
          ** Near Rodeo Drive **<br />
          Luxury Residence<br />
          Split-Level Floor Plan<br />
          Incredibly Spacious - 1,500 Sq. Ft.<br />
          Washer & Dryer Hookups<br />
          *BRAND NEW Kitchen*<br />
          Central A/C & Heat<br />
          Covered Parking<br />
          1 Small Pet Welcome!<br />
          <br />
          Property ID CODE: PL4856<br />
          Please refer to this code when contacting us about this unit.<br />
          <br />
          Upscale / Exclusive Property<br />
          Spacious Split-Level Layout<br />
          NEW Real Hardwood Flooring<br />
          Washer & Dryer Hookups In Unit<br />
          Community Laundry Room<br />
          Gorgeous Kitchen<br />
          NEW Quartz Countertops<br />
          NEW Custom Cabinets<br />
          NEW Stainless Steel Appliances<br />
          Samsung Stove/Oven<br />
          LG Dishwasher<br />
          Central Air & Heat<br />
          Master Bedroom w/ 2 Closets<br />
          Recessed Lighting<br />
          Beautiful Bathrooms<br />
          Rainfall Shower Head<br />
          2 Entrances<br />
          Abundant Closet Space<br />
          Dual Pane Windows<br />
          Plantation Shutters<br />
          Small Pet Considered (Under 10lbs.)<br />
          1 Covered Parking Space<br />
          Street Parking by Permit<br />
          <br />
          *Excellent Beverly Hills Location - Easy Access to Rodeo Drive, Westwood, Brentwood, Bel-Air, Century City, Culver City & West Hollywood!<br />
          <br />
          Use the \"REQUEST A VIEWING\" box at the top of the page for an immediate e-mail response.<br />
          *Make sure you enter your correct email address or you will not receive the viewing instructions.]]></description>
      </property>
      "
    doc = Nokogiri::XML(test)

    assert_nil Listing.parse(doc)
  end

test "parse property with 3 pictures" do
  test = "
    <property>
      <num-bathrooms>1</num-bathrooms>
      <num-bedrooms>1</num-bedrooms>
      <longitude>-118.3542751</longitude>
      <latitude>34.0782231</latitude>
      <street-address>228 S. Mariposa Ave.</street-address>
      <city-name>Los Angeles</city-name>
      <zipcode>90004</zipcode>
      <state-code>CA</state-code>
      <price>1150</price>
      <lp-url>http://www.pacificlistings.com/apartment-for-rent/central-la-mid-wilshire-korea-town-echo-park/pl4859/</lp-url>
      <provider-listingid>PL4857</provider-listingid>
      <listing-title>PL4856 - LUXURY RESIDENCE in PRIME Location! Spacious Split-Level Floor Plan, Real Hardwood, WandD H/U, Gorgeous Kitchen, Parking and Small Pet OK!</listing-title>
      <description><![CDATA[2 BEDROOMS + 2 BATHROOMS<br />
        PRIME Beverly Hills Location<br />
        ** Near Rodeo Drive **<br />
        Luxury Residence<br />
        Split-Level Floor Plan<br />
        Incredibly Spacious - 1,500 Sq. Ft.<br />
        Washer & Dryer Hookups<br />
        *BRAND NEW Kitchen*<br />
        Central A/C & Heat<br />
        Covered Parking<br />
        1 Small Pet Welcome!<br />
        <br />
        Property ID CODE: PL4856<br />
        Please refer to this code when contacting us about this unit.<br />
        <br />
        Upscale / Exclusive Property<br />
        Spacious Split-Level Layout<br />
        NEW Real Hardwood Flooring<br />
        Washer & Dryer Hookups In Unit<br />
        Community Laundry Room<br />
        Gorgeous Kitchen<br />
        NEW Quartz Countertops<br />
        NEW Custom Cabinets<br />
        NEW Stainless Steel Appliances<br />
        Samsung Stove/Oven<br />
        LG Dishwasher<br />
        Central Air & Heat<br />
        Master Bedroom w/ 2 Closets<br />
        Recessed Lighting<br />
        Beautiful Bathrooms<br />
        Rainfall Shower Head<br />
        2 Entrances<br />
        Abundant Closet Space<br />
        Dual Pane Windows<br />
        Plantation Shutters<br />
        Small Pet Considered (Under 10lbs.)<br />
        1 Covered Parking Space<br />
        Street Parking by Permit<br />
        <br />
        *Excellent Beverly Hills Location - Easy Access to Rodeo Drive, Westwood, Brentwood, Bel-Air, Century City, Culver City & West Hollywood!<br />
        <br />
        Use the \"REQUEST A VIEWING\" box at the top of the page for an immediate e-mail response.<br />
        *Make sure you enter your correct email address or you will not receive the viewing instructions.]]></description>
      <picture>
        <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/02/apartment-for-rent-beverly-hills-near-rodeo-dr-124182-13.jpg</picture-url>
      </picture>
      <picture>
        <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/02/apartment-for-rent-beverly-hills-near-rodeo-dr-124182-7.jpg</picture-url>
      </picture>
      <picture>
        <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/02/apartment-for-rent-beverly-hills-near-rodeo-dr-124182-8.jpg</picture-url>
      </picture>
    </property>
    "
    doc = Nokogiri::XML(test)

    assert Listing.parse(doc)
  end

  test "get existing listing if same listing_source_url" do
    test = "
      <property>
        <picture><picture-url>blah1.com</picture-url></picture>
        <picture><picture-url>blah2.com</picture-url></picture>
        <picture><picture-url>blah3.com</picture-url></picture>
        <street-address>1544 7th St.</street-address>
        <city-name>Santa Monica</city-name>
        <zipcode>90401</zipcode>
        <county />
        <state-code>CA</state-code>
        <lp-url>http://www.blah.com</lp-url>
      </property>"

    test2 = "
      <property>
        <picture><picture-url>blah1.com</picture-url></picture>
        <picture><picture-url>blah2.com</picture-url></picture>
        <picture><picture-url>blah3.com</picture-url></picture>
        <num-bathrooms>5</num-bathrooms>
        <lp-url>http://www.blah.com</lp-url>
      </property>"

    doc = Nokogiri::XML(test)
    doc2 = Nokogiri::XML(test2)

    Listing.parse(doc)
    Listing.parse(doc2)

    assert_equal 5, Listing.find_by(listing_source_url: 'http://www.blah.com').bathroom_count
  end
end