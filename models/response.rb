class Response < Sequel::Model
    many_to_one :survey
    many_to_one :question
    many_to_one :choice
    def validate
        super
        errors.add(:question_id, 'cannot be empty') if !question_id || question_id.empty?
        errors.add(:choice_id, 'cannot be empty') if !choice_id || choice_id.empty?
        errors.add(:survey_id, 'cannot be empty') if !survey_id || survey_id.empty?
    end
end