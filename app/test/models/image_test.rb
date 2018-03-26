require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  setup do
    @image = images(:one)
  end

  test 'it can have many stills projects' do
    # Create association
    @image.stills_projects << projects(:stills_project)
    # Check image has been added to stills project
    assert_equal @image.stills_projects.length, 1

    # Add another image
    @image.stills_projects << projects(:stills_project_2)
    # Check image has been added to stills project
    assert_equal @image.stills_projects.length, 2
  end

  test 'should be invalid without an image' do
    @image.image = ''
    refute @image.valid?, 'image should be invalid'
  end
end
