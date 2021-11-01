class Outcome < Sequel::Model
  many_to_one :career
  many_to_one :choice

  def validate
    super
    errors.add(:choice_id, 'cannot be empty') unless choice_id
    errors.add(:career_id, 'cannot be empty') unless career_id
  end
end
