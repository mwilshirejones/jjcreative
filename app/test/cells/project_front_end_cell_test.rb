require 'test_helper'

class ProjectFrontEndCellTest < Cell::TestCase
  test 'it shows' do
    html = cell(:project_front_end).call(:show)
    # assert html.match(/<html>/)
  end
end
