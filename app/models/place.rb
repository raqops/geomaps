class Place < ApplicationRecord
  geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
	after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
	if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
	reverse_geocoded_by :latitude, :longitude, :address => :full_address

	def full_address
		[country, city, street].compact.join(‘, ‘)
	end
end
