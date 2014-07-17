class Configuration < ActiveRecord::Base
	belongs_to :owner, polymorphic: true

	def self.[](key)
		@relation.where(key: key.to_s).last
	end 
end
