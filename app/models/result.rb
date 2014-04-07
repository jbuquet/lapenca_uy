class Result < ActiveRecord::Base
	belongs_to :forecast
	has_one :match
end
