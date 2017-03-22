class TouchesController < ApplicationController

  def new
    @match_set = MatchSet.find(params[:match_set_id])
    @fixture = @match_set.fixture
    @teams = Team.where("id = " + @fixture.home_team_id.to_s + " OR id = " + @fixture.away_team_id.to_s)
    @players = Player.where("team_id = " + @teams.ids.first.to_s + " OR id = " + @teams.ids.last.to_s)
    @touch = @match_set.touches.new
  end

  def create
    @match_set = MatchSet.find(params[:match_set_id])
    @touch = @match_set.touches.new(touch_params)

    if @touch.save
      redirect_to current_user
    else
      render "touches/new"
    end
  end

  private
    def touch_params
      params.require(:touch).permit(:team_id, :player_id, :position, :touch_type, :touch_result)
    end
end
