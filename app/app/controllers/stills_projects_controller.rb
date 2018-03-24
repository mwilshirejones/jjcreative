class StillsProjectsController < ApplicationController
  before_action :set_stills_project, only: [:edit, :update, :destroy]

  # GET /stills_projects/new
  def new
    @stills_project = StillsProject.new
  end

  # GET /stills_projects/1/edit
  def edit; end

  # POST /stills_projects
  # POST /stills_projects.json
  def create
    @stills_project = StillsProject.new(stills_project_params)

    respond_to do |format|
      if @stills_project.save
        format.html { redirect_to projects_url, notice: 'Stills project was successfully created.' }
        format.json { render :show, status: :created, location: @stills_project }
      else
        format.html { render :new }
        format.json { render json: @stills_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stills_projects/1
  # PATCH/PUT /stills_projects/1.json
  def update
    respond_to do |format|
      if @stills_project.update(stills_project_params)
        format.html { redirect_to projects_url, notice: 'Stills project was successfully updated.' }
        format.json { render :show, status: :ok, location: @stills_project }
      else
        format.html { render :edit }
        format.json { render json: @stills_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stills_projects/1
  # DELETE /stills_projects/1.json
  def destroy
    @stills_project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Stills project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stills_project
    @stills_project = StillsProject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stills_project_params
    params.require(:stills_project).permit(
      :title,
      :description,
      :short_description,
      :homepage_feature
    )
  end
end
