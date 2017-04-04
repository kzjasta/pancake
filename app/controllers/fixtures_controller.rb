class FixturesController < ApplicationController
  
  def show
    @fixture = Fixture.find(params[:id])
    @match_sets = @fixture.match_sets.all
    @home_team = @fixture.home_team
    @away_team = @fixture.away_team
    @home_score = 0
    @away_score = 0
    @attacks = 0
    @kills = 0
    @kill_blocks = 0
    @aces = 0
    @errors = 0
    @total = 0
    @efficiency = 0
    @passing_average = 0
  end

  def new
    @teams = current_user.teams.all
    @venues = Venue.all
    @fixture = current_user.fixtures.build if logged_in?
  end

  def create
    @teams = current_user.teams.all
    @venues = Venue.all
    @fixture = current_user.fixtures.build(fixture_params)
    if @fixture.save
      redirect_to current_user
    else
      render "fixtures/new"
    end
  end

  def edit
    @fixture = Fixture.find(params[:id])
  end

  def destroy
    @fixture = Fixture.find(params[:id])
    @fixture.delete
    flash[:success] = "Fixture Deleted"
    redirect_to root_path
  end 

  private

    def fixture_params
      params.require(:fixture).permit(:home_team_id, :away_team_id,:date_time, :description, :venue_id)
    end
end
