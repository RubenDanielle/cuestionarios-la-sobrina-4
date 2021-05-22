class Choice < Sequel::Model
	one_to_many :outcomes
	one_to_many :responses

	def validate
		super
		errors.add(:text, 'cannot be empty') if !text || text.empty?
		errors.add(:question_id, 'cannot be empty') if !question_id || question_id.empty?
	end
end
	