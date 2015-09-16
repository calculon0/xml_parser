require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test "parse photo" do
    test = 
      "<pictures>
        <picture>
          <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/01/apartment-for-rent-encino-near-ventura-blvd-122647-10.jpg</picture-url>
        </picture>
        <picture>
          <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/01/apartment-for-rent-encino-near-ventura-blvd-122647-24.jpg</picture-url>
        </picture>
        <picture>
          <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/01/apartment-for-rent-encino-near-ventura-blvd-122647-25.jpg</picture-url>
        </picture>
      </pictures>"
    doc = Nokogiri::XML(test)

    refute_nil Photo.parse_photos(Listing.create, doc) 
  end

  test "parse photo with no listing" do
    test = 
      "<pictures>
        <picture>
          <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/01/apartment-for-rent-encino-near-ventura-blvd-122647-10.jpg</picture-url>
        </picture>
        <picture>
          <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/01/apartment-for-rent-encino-near-ventura-blvd-122647-24.jpg</picture-url>
        </picture>
        <picture>
          <picture-url>http://www.pacificlistings.com/wp-content/uploads/2015/01/apartment-for-rent-encino-near-ventura-blvd-122647-25.jpg</picture-url>
        </picture>
      </pictures>"
    doc = Nokogiri::XML(test)

    assert_nil Photo.parse_photos(nil, doc) 
  end
end