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

  def new
    @team = current_user.teams.build if logged_in?
  end

  def edit

  end

  def destroy

  end


  private
    def team_params
      params.require(:team).permit(:name, :description)
    end
end

