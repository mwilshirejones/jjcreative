module ProjectsHelper
  def find_project_edit_path(project)
    return edit_stills_project_path(project) if project.type == 'StillsProject'

    edit_motion_project_path(project)
  end
end
