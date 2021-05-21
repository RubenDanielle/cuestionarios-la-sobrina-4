require File.expand_path '../../test_helper.rb', __FILE__

class SurveyTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase  

  def test_survey_must_have_username
    # Arrange
    survey = Survey.new   

    # Act
    survey.username = ''    

    # Assert
    assert_equal survey.valid?, false
  end  

  def test_survey_has_a_career
    # Arrange
    survey = Survey.new    

    # Act
    survey.id_career = nil 

    # Assert
    assert_equal survey.valid?, false
  end
end