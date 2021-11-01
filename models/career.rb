class Career < Sequel::Model
  one_to_many :outcomes
  one_to_many :surveys

  def validate
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
  end

  # funcion que toma un hash y devuelve un contador de
  # la cantidad de puntos de cada carrera en base a las respuestas del cuestionario
  def self.countUserPointsOnEachCareer(set, parameters)
    each do |career|
      set[career.id] = 0
    end

    # sumar el contador de cada carrera dependiendo de las respuestas dadas
    Question.all.each do |question|
      choice_selected = parameters[:"#{question.id}"].to_i
      Outcome.all.select do |out|
        choice_selected == out.choice_id
      end.each do |outcome|
        set[outcome.career_id] += 1
      end
    end

    set
  end
end
