require File.expand_path '../../test_helper.rb', __FILE__

class CareerTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase  

  def test_career_name_cannot_be_empty
    # Arrange
    career = Career.new    

    # Act
    career.name = '' 

    # Assert
    assert_equal career.valid?, false
  end

  def test_career_name_cannot_be_nil
    # Arrange
    career = Career.new    

    # Act
    career.name = nil

    # Assert
    assert_equal career.valid?, false
  end
end