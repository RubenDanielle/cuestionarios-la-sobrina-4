require File.expand_path '../test_helper.rb', __dir__

class OutcomeTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_outcome_has_a_choice
    # Arrange
    outcome = Outcome.new

    # Act
    outcome.choice_id = nil

    # Assert
    assert_equal outcome.valid?, false
  end

  def test_outcome_has_a_career
    # Arrange
    outcome = Outcome.new

    # Act
    outcome.career_id = nil

    # Assert
    assert_equal outcome.valid?, false
  end
end
