# The ProjectsController is only for used for showing an index of
# stills_projects and motion_projects

class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end
end
