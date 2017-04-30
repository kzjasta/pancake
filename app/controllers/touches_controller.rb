class TouchesController < ApplicationController

  def new
    get_touch_objects
    @touch = @match_set.touches.new
    @home_score = 0
    @away_score = 0
  end

  def create
    get_touch_objects
    @touch = @match_set.touches.new(touch_params)

    if @touch.save
      redirect_to new_match_set_touch_path
    else
      render "touches/new"
    end
  end

  def edit
    @touch = Touch.find(params[:id])
    set_id = @touch.match_set_id
    @match_set = MatchSet.find(set_id)
    @fixture = @match_set.fixture
    @teams = Team.where("id = " + @fixture.home_team_id.to_s + " OR id = " + @fixture.away_team_id.to_s)
    @players = Player.where("team_id = " + @teams.ids.first.to_s + " OR id = " + @teams.ids.last.to_s)
  end

  def update
    @touch = Touch.find(params[:id])
    set_id = @touch.match_set_id
    @match_set = MatchSet.find(set_id)

    if @touch.update(touch_params)
      flash[:notice] = "Touch was successfully updated"
      redirect_to new_match_set_touch_path(@match_set)
    else
      render 'edit'
    end

  end

  #Declares the instance variables needed for Touch actions.
  def get_touch_objects
    @match_set = MatchSet.find(params[:match_set_id])
    @fixture = @match_set.fixture
    @teams = Team.where("id = " + @fixture.home_team_id.to_s + " OR id = " + @fixture.away_team_id.to_s)
    @players = Player.where("team_id = " + @teams.ids.first.to_s + " OR id = " + @teams.ids.last.to_s)
  end

  private
    def touch_params
      params.require(:touch).permit(:team_id, :player_id, :position, :touch_type, :touch_result)
    end
end
