class Response < Sequel::Model
  many_to_one :survey
  many_to_one :question
  many_to_one :choice
  def validate
    super
    errors.add(:question_id, 'cannot be empty') unless question_id
    errors.add(:choice_id, 'cannot be empty') unless choice_id
    errors.add(:survey_id, 'cannot be empty') unless survey_id
  end
end
