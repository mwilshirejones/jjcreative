require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:stills_project)
  end

  test 'should be invalid without a title' do
    @project.title = nil
    refute @project.valid?, 'project should be invalid'
  end

  test 'slug should equal title if blank' do
    @project.slug = ''
    title = @project.title.parameterize

    # We need to save because fallbacks are set using
    # before_save callback.
    @project.save

    assert_equal title, @project.slug
  end

  test 'slug should equal self if present' do
    slug = 'sluggy'
    @project.slug = slug
    assert_equal slug, @project.slug
  end
end
