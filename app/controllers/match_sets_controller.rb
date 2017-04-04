class MatchSetsController < ApplicationController
  include ApplicationHelper

  def show
    @match_set = MatchSet.find(params[:id])
    @fixture = @match_set.fixture
    @home_team = @fixture.home_team
    @away_team = @fixture.away_team
    @home_score = 0
    @away_score = 0
    @kills = 0
    @blocks = 0
    @aces = 0
    @errors = 0
    @total = 0
    @efficiency = 0
    @passing_average = 0
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
