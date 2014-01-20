# XmlContactsExtractor

Extracts contact information from XML. Dictionary based information extractor from any valid XML. Dependent on Nokogiri.

## Installation

Add this line to your application's Gemfile:

    gem 'xml_contacts_extractor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xml_contacts_extractor

## Usage

Create an instance

    obj = XmlContactsExtractor::Search.new
	xml = '<root><fname>John</fname><lname>Doe</lname><email>john@doe.com</email><phone>123-456-7890</phone></root>'
    obj.extract_contacts(xml)

Use contact info

    obj.fname
	obj.lname
	obj.email
	obj.phone
	obj.address
	obj.city
	obj.state
	obj.zip

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
