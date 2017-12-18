class StudyGroupsController < ApplicationController
  before_action :set_study_group, only: [:show, :edit, :update, :destroy]

  # Find student's course groups()
  # returns all groups that student that is logged inhas joined
  def index
    @study_groups = StudyGroup.all
  end


  # Display course group()
  # displays selected course group and all links within
  def show
    @links = LinksController.get_links(@study_group.id, params)
    @vote = Vote.new
  end


  def new
    @study_group = StudyGroup.new
  end


  def edit
  end

  # Create a new group()
  # creates new group
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


  # delete_group()
  def destroy
    @study_group.destroy
    respond_to do |format|
      format.html { redirect_to study_groups_url, notice: 'Study group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_study_group
      @study_group = StudyGroup.find(params[:id])
    end

    def study_group_params
      params.require(:study_group).permit(:name)
    end
end
