class StudyGroupsController < ApplicationController
  before_action :set_study_group, only: [:show, :edit, :update, :destroy]

  # GET /study_groups
  # GET /study_groups.json
  def index
    @study_groups = StudyGroup.all
  end

  # StudyGroup is composed from link entities
  def show
    @links = LinksController.get_links(@study_group.id)
  end

  # GET /study_groups/new
  def new
    @study_group = StudyGroup.new
  end

  # GET /study_groups/1/edit
  def edit
  end

  # POST /study_groups
  # POST /study_groups.json
  def create
    @study_group = StudyGroup.new(study_group_params)

    respond_to do |format|
      if @study_group.save
        format.html { redirect_to @study_group, notice: 'Study group was successfully created.' }
        format.json { render :show, status: :created, location: @study_group }
      else
        format.html { render :new }
        format.json { render json: @study_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_groups/1
  # PATCH/PUT /study_groups/1.json
  def update
    respond_to do |format|
      if @study_group.update(study_group_params)
        format.html { redirect_to @study_group, notice: 'Study group was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_group }
      else
        format.html { render :edit }
        format.json { render json: @study_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_groups/1
  # DELETE /study_groups/1.json
  def destroy
    @study_group.destroy
    respond_to do |format|
      format.html { redirect_to study_groups_url, notice: 'Study group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_group
      @study_group = StudyGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_group_params
      params.require(:study_group).permit(:name)
    end
end
