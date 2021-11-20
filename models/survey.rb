class Survey < Sequel::Model
  many_to_one :career
  one_to_many :responses

  def validate
    super
    errors.add(:username, 'cannot be empty') if !username || username.empty?
    errors.add(:career_id, 'cannot be empty') unless career_id
  end

  def load_responses(parameters)
    Question.all.each do |question|
      response = Response.new(survey_id: self.id, question_id: question.id,
                              choice_id: parameters[:"#{question.id}"])
      response.save
    end
  end
end
