require 'minitest/autorun'

class Image

  def initialize(image)
    @pixel_rows = image
  end

  def blur
    
    new_pixel_rows = Marshal.load(Marshal.dump(@pixel_rows))
   
    @pixel_rows.each_with_index do |row, row_i|
      row.each_with_index do |column_v, column_i|
        if column_v == 1
          new_pixel_rows[row_i][column_i - 1] = 1 if column_i - 1 >= 0
          new_pixel_rows[row_i][column_i + 1] = 1 if column_i + 1 < row.size
          new_pixel_rows[row_i - 1][column_i] = 1 if row_i - 1 >= 0
          new_pixel_rows[row_i + 1][column_i] = 1 if row_i < @pixel_rows.count - 1
        end
      end
    end
    
    new_pixel_rows
    
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
    
    assert_equal expected_blur, image.blur
    
  end

  def test_image_blur_02
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 1, 0],
      [0, 1, 1, 1],
      [0, 1, 1, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
    ]
    
    assert_equal expected_blur, image.blur

  end

  def test_image_blur_03
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 1, 0, 0],
      [1, 0, 0, 0]
    ]

    assert_equal expected_blur, image.blur
    
  end

  def test_image_blur_04
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 1, 1],
      [0, 0, 0, 1]
    ]
    
    assert_equal expected_blur, image.blur

  end

  def test_image_blur_05
    
    image = Image.new([
      [1, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [1, 1, 0, 0],
      [1, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end
  
  def test_image_blur_06
    
    image = Image.new([
      [0, 0, 0, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 1, 1],
      [0, 0, 0, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end
  
  def test_image_blur_07
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 1, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_08
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 1]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 1, 1]
    ]

    assert_equal expected_blur, image.blur

  end
  
  def test_image_blur_09
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 1, 0, 0],
      [1, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_10
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 1, 1],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_11
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [0, 1, 1, 0],
      [0, 0, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end
  
  def test_image_blur_12
    
    image = Image.new([
      [0, 0, 0, 0],
      [1, 0, 0, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 1],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [1, 0, 0, 1],
      [1, 1, 1, 1],
      [1, 0, 0, 1],
      [1, 0, 0, 1],
      [1, 1, 1, 1],
      [1, 0, 0, 1]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_13
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 1, 0, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0],
      [0, 0, 1, 0],
      [0, 1, 1, 1],
      [0, 0, 1, 0]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_14
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 1, 0],
      [0, 1, 1, 1],
      [0, 0, 1, 0],
      [0, 1, 0, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_15
    
    image = Image.new([
      [0, 1, 1, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 1, 0]
    ])
    
    expected_blur = [
      [1, 1, 1, 1],
      [0, 1, 1, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [1, 1, 1, 1]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_16
    
    image = Image.new([
      [1, 0, 0, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 1]
    ])
    
    expected_blur = [
      [1, 1, 1, 1],
      [1, 0, 0, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 1],
      [1, 1, 1, 1]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_17
    
    image = Image.new([
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [1, 0, 0, 0],
      [1, 1, 0, 0],
      [1, 1, 1, 0],
      [0, 1, 1, 1],
      [0, 0, 1, 1],
      [0, 0, 0, 1]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_18
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 1, 0],
      [0, 1, 0, 0],
      [1, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 1],
      [0, 0, 1, 1],
      [0, 1, 1, 1],
      [1, 1, 1, 0],
      [1, 1, 0, 0],
      [1, 0, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end

  def test_image_blur_19
    
    image = Image.new([
      [0, 0, 0, 0],
      [1, 0, 0, 1],
      [0, 1, 1, 0],
      [0, 1, 1, 0],
      [1, 0, 0, 1],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [1, 0, 0, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 0, 0, 1]
    ]

    assert_equal expected_blur, image.blur

  end
  
  def test_image_blur_20
    
    image = Image.new([
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 1, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ])
    
    expected_blur = [
      [0, 0, 0, 0],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [1, 1, 1, 1],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]

    assert_equal expected_blur, image.blur

  end

end