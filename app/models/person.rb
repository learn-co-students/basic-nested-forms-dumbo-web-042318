class Person < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses
  # this method turns the name from 
  # person_addresses_street_address_1
  # to: 
  # person_addresses_attributes_0_street_address_1
  # and changest field_for :a

   def addresses_attributes=(addresses_attributes)
     addresses_attributes.each do |address_attributes|
       self.addresses.build(address_attributes)
     end 
   end 

   # this version would prevent duplicates 
#   class Song < ActiveRecord::Base
#      def artist_attributes=(artist)
#        self.artist = Artist.find_or_create_by(name: artist.name)
#      self.artist.update(artist)
#    end
#  end


end
