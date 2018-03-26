require 'test_helper'

class StillsProjectTest < ActiveSupport::TestCase
  setup do
    @stills_project = projects(:stills_project)
  end

  test 'it can have many images' do
    # Create association
    @stills_project.images << images(:one)
    # Check image has been added to stills project
    assert_equal @stills_project.images.length, 1

    # Add another image
    @stills_project.images << images(:two)
    # Check image has been added to stills project
    assert_equal @stills_project.images.length, 2
  end
end
