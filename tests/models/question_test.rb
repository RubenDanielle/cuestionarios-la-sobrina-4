require File.expand_path '../../test_helper.rb', __FILE__

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
  def test_question_must_have_name
  	# Arrange
    question = Question.new    

    # Act
    question.name = '' 

    # Assert
    assert_equal question.valid?, false
  end
end