require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  setup do
    @image = images(:one)
  end

  test 'should be invalid without an image' do
    @image.image = ''
    refute @image.valid?, 'image should be invalid'
  end
end
