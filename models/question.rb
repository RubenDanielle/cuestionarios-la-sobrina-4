class Question < Sequel::Model
	one_to_many :responses
	one_to_many :choices
	def validate
		super
		errors.add(:number, 'cannot be empty') if !number || number.empty?
        errors.add(:name, 'cannot be empty') if !name || name.empty?
	end
end
	