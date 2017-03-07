class MatchSetsController < ApplicationController
  include ApplicationHelper
  
  def index
    @fixture =  Fixture.find(params[:fixture_id])
    @match_set = @fixture.match_sets.all
  end

  def new
    @fixture = Fixture.find(params[:fixture_id])
    @match_set = @fixture.match_sets.new
  end

  def create 
    @fixture = Fixture.find(params[:fixture_id])
    @match_set = @fixture.match_sets.new(match_set_params)

    if @match_set.save
      redirect_to fixture_path(@fixture)
    else
      render 'new'
    end
  end

  def edit
    @fixture = Fixture.find(params[:id])
    @match_set = @fixture.match_set(match_set_params)
  end

  def destroy
    @match_set = MatchSet.find(params[:id])
    @match_set.delete
    flash[:success] = "Set Deleted"
    redirect_to root_url
  end


  private
    def match_set_params
      params.require(:match_set).permit(:set_number, :home_score, :away_score, :fixture_id)
    end

end
