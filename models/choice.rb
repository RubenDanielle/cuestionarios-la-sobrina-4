class Choice < Sequel::Model
	one_to_many :Outcome
	one_to_many :Response
end
	