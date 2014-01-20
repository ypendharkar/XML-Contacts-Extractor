require "xml_contacts_extractor/version"
require "nokogiri"

module XmlContactsExtractor
  
  def self.extract_contacts(xml)

    # get possible matches
    first_name_choices = ["first_name", "fname", "f_name", "firstname", "FirstName", "First", "name"]
    last_name_choices  = ["lastname", "last_name", "lname", "l_name", "LastName", "Last"]
    email_choices      = ["email", "email_address", "email_addy", "EmailAddress"]
    address_choices    = ["address", "address_1", "Addr1", "property_addr", "addr", "line1", "Address1", "address1"]
    phone_choices      = ["phone", "phone_number", "phone_num", "PhoneNumberValue", "Phone", "Phone1"]
    ip_address_choices = ["ip_address", "ip_addy", "ip", "ipaddress"]
    city_choices       = ["city", "City"]
    state_choices      = ["state", "State", "StateProvCd", "state_province"]
    zip_choices        = ["zip", "Zip", "PostalCode", "postal_code", "ZIPCode"]

    xml = xml.gsub(/\n|\\n|\\/, '')
    xml_doc  = Nokogiri::XML(xml)
    p xml_doc

    first_name_choices.each do |f|
      #@first_name = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @first_name.blank?
        @first_name = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    last_name_choices.each do |f|
      #@last_name = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]")
        @last_name = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    email_choices.each do |f|
      #@email = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]")
        @email = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    phone_choices.each do |f|
      #@phone = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]")
        @phone = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    address_choices.each do |f|
      #@address = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]")
        @address = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    city_choices.each do |f|
      #@city = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]")
        @city = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    state_choices.each do |f|
      #@state = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]")
        @state = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    zip_choices.each do |f|
      #@zip = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]")
        @zip = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    ip_address_choices.each do |f|
      #@ip_address = xml_doc.at_xpath("//#{f}").content.to_s if xml_doc.at_xpath("//#{f}")
      if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]")
        @ip_address = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
      end
    end

    matched_fields = {} # attempt to find and grab required fields to be stored in physical columns
    matched_fields = {
      :first_name   => @first_name,
      :last_name    => @last_name,
      :address      => @address,
      :phone        => @phone,
      :email        => @email,
      :ip_address   => @ip_address,
      :city         => @city,
      :state        => @state,
      :zip          => @zip
    }
    matched_fields || {}
    p matched_fields
  end
  
end
