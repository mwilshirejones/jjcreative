require 'test_helper'

class ProjectFrontEndCellTest < Cell::TestCase
  setup do
    @project = projects(:stills_project)
  end

  test 'it shows' do
    html = cell(:project_front_end, @project).call(:show)
    assert html.has_xpath?('//html')
  end
end
