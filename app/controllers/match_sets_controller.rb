class MatchSetsController < ApplicationController
  
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


  private
    def match_set_params
      params.require(:match_set).permit(:set_number, :home_score, :away_score, :fixture_id)
    end

end
