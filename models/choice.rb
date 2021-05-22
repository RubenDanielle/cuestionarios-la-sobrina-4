class Choice < Sequel::Model
	one_to_many :outcomes
	one_to_many :responses
end
	