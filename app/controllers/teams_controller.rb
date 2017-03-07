class TeamsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :show, :destroy]
  
  def create 
    @team = current_user.teams.build(team_params)
    if @team.save
      redirect_to current_user
    else
      render "teams/new"
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = current_user.teams.build if logged_in?
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:notice] = "Team was successfully updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    team_id = @team.id
    Fixture.where(:home_team => team_id).destroy_all
    Fixture.where(:away_team => team_id).destroy_all
    @team.destroy
    flash[:success] = "Team Deleted"
    redirect_to current_user
  end

  private
    def team_params
      params.require(:team).permit(:name, :description)
    end
end

