# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xml_contacts_extractor/version'

Gem::Specification.new do |spec|
  spec.name          = "xml_contacts_extractor"
  spec.version       = XmlContactsExtractor::VERSION
  spec.authors       = ["Yogesh Pendharkar"]
  spec.email         = ["yogesh.pendharkar@gmail.com"]
  spec.description   = %q{Extracts contact information from XML. Dictionary based information extractor from any valid XML.}
  spec.summary       = %q{Extracts contact information from XML}
  spec.homepage      = "https://github.com/ypendharkar/XML-Contacts-Extractor"
  spec.license       = "MIT"
  
  spec.add_runtime_dependency "nokogiri"
  spec.add_development_dependency "rspec"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
