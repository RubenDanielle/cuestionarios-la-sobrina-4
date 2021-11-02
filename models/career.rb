class Career < Sequel::Model
  one_to_many :outcomes
  one_to_many :surveys

  def validate
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
  end

  def self.points_by_career(set, parameters)
    each do |career|
      set[career.id] = 0
    end
    Question.all.each do |question|
      choice_selected = parameters[:"#{question.id}"].to_i
      outcomes = Outcome.where(choice_id: choice_selected)
      outcomes.map { |outcome| set[outcome.career_id] += 1 }   
    end
    set
  end
end