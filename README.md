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

Extract elements from XML

    a.extract_contacts(xml)

Use contact info

    a.fname
	a.lname
	a.email
	a.phone
	a.address
	a.city
	a.state
	a.zip

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
