class Question < Sequel::Model
	one_to_many :Response
	one_to_many :Choices
end
	