require File.expand_path '../../test_helper.rb', __FILE__

class SurveyTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase  

  def test_survey_username_cannot_be_empty
    # Arrange
    survey = Survey.new   

    # Act
    survey.username = ''    

    # Assert
    assert_equal survey.valid?, false
  end  

  def test_survey_username_cannot_be_nil
    # Arrange
    survey = Survey.new   

    # Act
    survey.username = nil   

    # Assert
    assert_equal survey.valid?, false
  end

  def test_survey_has_a_career
    # Arrange
    survey = Survey.new    

    # Act
    survey.career_id = nil 

    # Assert
    assert_equal survey.valid?, false
  end
end