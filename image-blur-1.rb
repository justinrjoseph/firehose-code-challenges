require 'minitest/autorun'

class Image

  def initialize(image)
    @pixel_rows = image
  end

  def output
    @pixel_rows.each { |pixel_row| puts pixel_row.join ' ' }
  end

end



class ImageBlurTest < MiniTest::Test
  
  def test_image_blur
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ])
    
    expected_output = [[0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0]]
    
    assert_equal expected_output, image.output
    
  end
  
end