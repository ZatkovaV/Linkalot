class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]


  # Display_all_links_within_study_group()

  # fetches all links with counts of their votes within a selected study groups
  # therefore it also implements Count_votes_of_link() method
  def self.get_links(study_group_id, params)
    @link = Link.select("links.id, links.title, links.url, links.description, COALESCE(SUM(votes.value), 0) as vote_sum")
                .left_outer_joins(:votes)
                .where(study_group_id: study_group_id).group("links.id").order("vote_sum DESC")
                .paginate(:page => params[:page], :per_page => 6)
  end


  # search_links()
  def search_links(query)
    @link = Link.find_by(title: query)
  end


  # creates new link allowing user to input its attributes
  def new
    @study_group_id = params[:group_id]
    @link = Link.new
  end


  # Create_new_link()
  # Creates and stores new link
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        group = StudyGroup.find(@link.study_group_id)
        format.html { redirect_to group }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end


  # Delete_link()
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url, :description, :study_group_id, :keywords)
    end
end
