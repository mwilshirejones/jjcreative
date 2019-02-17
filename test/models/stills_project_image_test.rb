require 'test_helper'

class StillsProjectImageTest < ActiveSupport::TestCase
  setup do
    @stills_project_image = stills_project_images(:one)
  end

  test 'it can belong to an image' do
    # Create association, test will throw error if
    # belongs_to is not present in model
    @stills_project_image.image = images(:one)

    # Ensure new association overrides previous,
    # but this seems semi-pointless as it's rails
    # functionality? But I guess it safeguards against
    # an oddly named/non-pluralized has_many association
    # or something?
    prev_image_id = @stills_project_image.image_id
    @stills_project_image.image = images(:two)
    assert_not_equal @stills_project_image.image_id, prev_image_id
  end

  test 'it can belong to a stills project' do
    # Create association, test will throw error if
    # belongs_to is not present in model
    @stills_project_image.stills_project = projects(:stills_project)

    # Ensure new association overrides previous,
    # but this seems semi-pointless as it's rails
    # functionality? But I guess it safeguards against
    # an oddly named/non-pluralized has_many association
    # or something?
    prev_project_id = @stills_project_image.stills_project_id
    @stills_project_image.stills_project = projects(:stills_project_2)
    assert_not_equal @stills_project_image.stills_project_id, prev_project_id
  end
end
