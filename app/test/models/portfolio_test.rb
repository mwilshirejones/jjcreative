require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  setup do
    @portfolio = portfolios(:one)
  end

  test 'should be invalid without a title' do
    @portfolio.title = nil
    refute @portfolio.valid?, 'portfolio should be invalid'
  end

  test 'nav_title should equal title if left blank' do
    @portfolio.nav_title = nil
    assert_equal @portfolio.title, @portfolio.nav_title
  end

  # TODO: Work this one out...more for front end? Shold use cells!
  # test 'should be disabled if it has no projects' do
  # end
end
