class MotionProjectsController < ApplicationController
  before_action :set_motion_project, only: [:show, :edit, :update, :destroy]

  # GET /motion_projects
  # GET /motion_projects.json
  def index
    @motion_projects = MotionProject.all
  end

  # GET /motion_projects/1
  # GET /motion_projects/1.json
  def show
  end

  # GET /motion_projects/new
  def new
    @motion_project = MotionProject.new
  end

  # GET /motion_projects/1/edit
  def edit
  end

  # POST /motion_projects
  # POST /motion_projects.json
  def create
    @motion_project = MotionProject.new(motion_project_params)

    respond_to do |format|
      if @motion_project.save
        format.html { redirect_to @motion_project, notice: 'Motion project was successfully created.' }
        format.json { render :show, status: :created, location: @motion_project }
      else
        format.html { render :new }
        format.json { render json: @motion_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motion_projects/1
  # PATCH/PUT /motion_projects/1.json
  def update
    respond_to do |format|
      if @motion_project.update(motion_project_params)
        format.html { redirect_to @motion_project, notice: 'Motion project was successfully updated.' }
        format.json { render :show, status: :ok, location: @motion_project }
      else
        format.html { render :edit }
        format.json { render json: @motion_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motion_projects/1
  # DELETE /motion_projects/1.json
  def destroy
    @motion_project.destroy
    respond_to do |format|
      format.html { redirect_to motion_projects_url, notice: 'Motion project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motion_project
      @motion_project = MotionProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motion_project_params
      params.require(:motion_project).permit(
        :title,
        :description,
        :short_description,
        :homepage_feature)
    end
end
