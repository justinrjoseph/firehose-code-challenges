require 'minitest/autorun'

class Image

  def initialize(image)
    @pixel_rows = image
  end

  def blur(distance)

    manhattan_rows = { 0 => Marshal.load(Marshal.dump(@pixel_rows)) }
    
    (0..distance - 1).each do |n|
      manhattan_rows[n + 1] = Marshal.load(Marshal.dump(manhattan_rows[n]))
      
      manhattan_rows[n].each_with_index do |row, row_i|
        row.each_with_index do |column_v, column_i|
          if column_v == 1
            manhattan_rows[n + 1][row_i][column_i - 1] = 1 if column_i - 1 >= 0
            manhattan_rows[n + 1][row_i][column_i + 1] = 1 if column_i + 1 < row.size
            manhattan_rows[n + 1][row_i - 1][column_i] = 1 if row_i - 1 >= 0
            manhattan_rows[n + 1][row_i + 1][column_i] = 1 if row_i < manhattan_rows[n].count - 1
          end
        end
      end
    end

    manhattan_rows.values.last

  end

end



class ImageBlurTest < MiniTest::Test

  def test_image_blur_01
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
    ]
    
    assert_equal expected_blur, image.blur(1)
    
  end

  def test_image_blur_02
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [1, 1, 1, 0],
      [1, 1, 1, 1],
      [1, 1, 1, 0],
      [0, 1, 0, 0]
    ]
    
    assert_equal expected_blur, image.blur(2)
    
  end

  def test_image_blur_03
    
    image = Image.new([
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1]
    ])
    
    expected_blur = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [1, 1, 1, 1, 1, 1, 1, 0, 0],
      [0, 1, 1, 1, 1, 1, 0, 0, 0],
      [0, 0, 1, 1, 1, 0, 0, 0, 0],
      [0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 1],
      [0, 0, 0, 0, 0, 0, 0, 1, 1],
      [0, 0, 0, 0, 0, 0, 1, 1, 1],
      [0, 0, 0, 0, 0, 1, 1, 1, 1],
    ]
    
    assert_equal expected_blur, image.blur(3)
    
  end

end