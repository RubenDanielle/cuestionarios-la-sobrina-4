require File.expand_path '../test_helper.rb', __dir__

class ResponseTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_response_must_has_question
    # Arrange
    response = Response.new

    # Act
    response.question_id = nil

    # Assert
    assert_equal response.valid?, false
  end

  def test_response_must_has_choice
    # Arrange
    response = Response.new

    # Act
    response.choice_id = nil

    # Assert
    assert_equal response.valid?, false
  end

  def test_response_must_has_survey
    # Arrange
    response = Response.new

    # Act
    response.survey_id = nil

    # Assert
    assert_equal response.valid?, false
  end
end
