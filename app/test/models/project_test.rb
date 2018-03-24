require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:stills_project)
  end

  test 'should be invalid without a title' do
    @project.title = nil
    refute @project.valid?, 'project should be invalid'
  end

  test 'short_description should equal description if blank' do
    @project.short_description = ''

    # We need to save because fallbacks are set using
    # before_save callback.
    @project.save

    assert_equal @project.description, @project.short_description
  end

  # TODO: This should be part of the above test...
  test 'short_description should equal self if present' do
    short_description = 'Short description'
    @project.short_description = short_description
    assert_equal short_description, @project.short_description
  end
end
