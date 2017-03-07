class PlayersController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :show, :destroy]

  def create 
    @team = current_user.teams.find(params[:team_id])
    @player = @team.players.new(player_params)

    if @player.save
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end

  def new
    @team = current_user.teams.find(params[:team_id])
    @player = @team.players.new
  end

  def edit
    @team = current_user.teams.find(params[:team_id])
    @player = @team.players(player_params)
  end

  def update
    @team = current_user.teams.find(params[:team_id])
    if @team.players.update(player_params)
      flash[:notice] = "Team was successfully updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.delete
    flash[:success] = "Player Deleted"
    redirect_to root_path
  end

  private
    def player_params
      params.require(:player).permit(:first_name, :last_name, :date_of_birth, 
                                     :height, :weight, :position, :spike_reach, 
                                     :block_reach, :nationality, :image)
    end

end
