class Configuration < ActiveRecord::Base
	belongs_to :owner, polymorphic: true

	scope :[], lambda {|key| where(key: key.to_s).last } 
end
