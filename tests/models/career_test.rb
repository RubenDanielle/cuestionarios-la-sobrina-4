require File.expand_path '../../test_helper.rb', __FILE__

class CareerTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase  

  def test_career_must_have_name
    # Arrange
    career = Career.new    

    # Act
    career.name = '' 

    # Assert
    assert_equal career.valid?, false
  end
end