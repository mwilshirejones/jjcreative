require 'test_helper'
require 'irb'

class PortfolioTest < ActiveSupport::TestCase
  setup do
    @portfolio = portfolios(:one)
  end

  test 'should be invalid without a title' do
    @portfolio.title = nil
    refute @portfolio.valid?, 'portfolio should be invalid'
  end

  test 'nav_title should equal title if blank' do
    @portfolio.nav_title = ''

    # We need to save because fallbacks are set using
    # before_save callback.
    @portfolio.save

    assert_equal @portfolio.title, @portfolio.nav_title
  end

  # TODO: This should be part of the above test...
  test 'nav_title should equal self if present' do
    nav_title = 'Nav Title'
    @portfolio.nav_title = nav_title
    assert_equal nav_title, @portfolio.nav_title
  end

  test 'should list title and short_description of associated projects' do
    # @portfolio.project_list should return an array,
    # not a hash/nil etc.
    projects = @portfolio.project_list
    assert_instance_of Array, projects

    # A project in the list should be a Hash
    first_project = projects[0]
    assert_instance_of Hash, first_project

    # Should have title and short_description in Hash
    assert first_project.key?(:title) && first_project.key?(:short_description)
  end

  # TODO: More for front end...will use cells!
  # test 'should be disabled if it has no projects' do
  # end
end
