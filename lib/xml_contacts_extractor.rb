require "xml_contacts_extractor/version"
require "nokogiri"

module XmlContactsExtractor
  
  class Search
  
    attr_accessor :first_name, :fname, :last_name, :lname, :email, :phone, :address, :city, :state, :zip, :ip_address
  
    def extract_contacts(xml)

      # Different possible variations
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

      # First name
      first_name_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @first_name.blank?
          @first_name = @fname = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end

      # Last name
      last_name_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @last_name.blank?
          @last_name = @lname = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end

      # Email
      email_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @email.blank?
          @email = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end

      # Phone
      phone_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @phone.blank?
          @phone = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end

      # Address
      address_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @address.blank?
          @address = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end

      # City
      city_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @city.blank?
          @city = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end

      # State
      state_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @state.blank?
          @state = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end

      # Zip
      zip_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @zip.blank?
          @zip = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end

      # IP Address
      ip_address_choices.each do |f|
        if xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]") && @ip_address.blank?
          @ip_address = xml_doc.at_xpath("//*[contains(translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'), '#{f}')]").content.to_s
        end
      end
    end
    
  end
  
end