require File.expand_path '../test_helper.rb', __dir__

class ChoiceTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_choice_text_cannot_be_empty
    # Arrange
    choice = Choice.new

    # Act
    choice.text = ''

    # Assert
    assert_equal choice.valid?, false
  end

  def test_choice_text_cannot_be_nil
    # Arrange
    choice = Choice.new

    # Act
    choice.text = nil

    # Assert
    assert_equal choice.valid?, false
  end

  def test_choice_has_a_question
    # Arrange
    choice = Choice.new

    # Act
    choice.question_id = nil

    # Assert
    assert_equal choice.valid?, false
  end
end
