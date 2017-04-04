module MatchSetsHelper

  #Checks which set score is higher
  def checkScore(score1, score2)
    if score1 > score2
      return true
    else
      return false
    end
  end

  #Calculates the set stats for each player in a team
  def get_set_stats(player)
    @attacks = Touch.where("player_id = " + player.id.to_s + " AND touch_type = 'Attack' AND match_set_id = " + @match_set.id.to_s).count
    @kills = Touch.where("player_id = " + player.id.to_s + " AND touch_result = 'kill' AND match_set_id = " + @match_set.id.to_s).count
    @kill_blocks = Touch.where("player_id = " + player.id.to_s + " AND touch_result = 'kill block' AND match_set_id = " + @match_set.id.to_s).count
    @aces = Touch.where("player_id = " + player.id.to_s + " AND touch_result = 'ace' AND match_set_id = " + @match_set.id.to_s).count
    @total = @kills.to_i + @killblocks.to_i + @aces.to_i
    @passes = Touch.where("player_id = " + player.id.to_s + " AND touch_type = 'Pass' AND match_set_id = " + @match_set.id.to_s).count
    @efficiency = ((@kills.to_f - @errors.to_f) / @attacks.to_f) * 100
  end

  #Retrieves number of errors a player has made while attacking in a set
  def get_set_attack_errors(player)
    @errors=0
    errors = ['out','net','attack violation', 'foot fault', 'handling error', 'invasion', 'blocked']
    @touches = Touch.where("player_id = " + player.id.to_s + " AND touch_type = 'Attack' AND match_set_id = " + @match_set.id.to_s)
    @touches.each do |touch|
      if errors.include?(touch.touch_result)
        @errors+=1
      end
    end
  end

  #Calculates the set passing average of a player
  def get_set_pass_average(player)
    @passing_average = 0
    pass_list = []
    @passes = Touch.where("player_id = " + player.id.to_s + " AND touch_type = 'Pass' AND match_set_id = " + @match_set.id.to_s)
    @passes.each do |pass|
      pass_list.push(pass.touch_result.to_i)
    end
    @passing_average = (pass_list.sum.to_i) / (pass_list.size.to_f)
  end

end