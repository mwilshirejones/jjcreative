require 'test_helper'

class ProjectFrontEndCellTest < Cell::TestCase
  setup do
    @project = projects(:stills_project)
  end

  test 'it shows' do
    html = cell(:project_front_end, @project).call(:show)
    assert html.has_xpath?('//html')
  end

  test 'it renders description markdown as HTML' do
    @project.description = 'This is *bongos*, indeed.'
    html = cell(:project_front_end, @project).call(:show)

    has_em_element = html.all(:xpath, '//em').map do |element|
      element.text == 'bongos'
    end.compact.first

    assert has_em_element
  end
end
