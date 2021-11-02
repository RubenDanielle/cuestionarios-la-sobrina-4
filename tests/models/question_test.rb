require File.expand_path '../test_helper.rb', __dir__

class QuestionTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_question_must_have_number
    # Arrange
    question = Question.new

    # Act
    question.number = nil

    # Assert
    assert_equal question.valid?, false
  end

  def test_question_name_cannot_be_empty
    # Arrange
    question = Question.new

    # Act
    question.name = ''

    # Assert
    assert_equal question.valid?, false
  end

  def test_question_name_cannot_be_nil
    # Arrange
    question = Question.new

    # Act
    question.name = nil

    # Assert
    assert_equal question.valid?, false
  end

  def test_question_type_cannot_be_nil
    # Arrange
    question = Question.new

    # Act
    question.type = nil

    # Assert
    assert_equal question.valid?, false
  end

  def test_question_type_cannot_be_empty
    # Arrange
    question = Question.new

    # Act
    question.type = ''

    # Assert
    assert_equal question.valid?, false
  end
end
