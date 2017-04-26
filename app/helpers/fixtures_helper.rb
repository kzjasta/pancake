module FixturesHelper

  #Gets the match stats for a player
  def get_stats(player)
    @kills = 0
    @attacks = 0
    @kill_blocks =0
    @aces = 0
    @total = 0
    @passes = 0
    
    if @match_sets.any?
      @match_sets.each do |set|
        @kills += Touch.where("player_id = " + player.id.to_s + " AND touch_result = 'kill' AND match_set_id = " + set.id.to_s).count
        @attacks += Touch.where("player_id = " + player.id.to_s + " AND touch_type = 'Attack' AND  match_set_id " + " = " + set.id.to_s).count
        @kill_blocks += Touch.where("player_id = " + player.id.to_s + " AND touch_result = 'kill block' AND match_set_id = " + set.id.to_s).count
        @aces += Touch.where("player_id = " + player.id.to_s + " AND touch_result = 'ace' AND match_set_id = " + set.id.to_s).count
        @passes = Touch.where("player_id = " + player.id.to_s + " AND touch_type = 'Pass' AND match_set_id = " + set.id.to_s).count
        @total = @kills.to_i + @killblocks.to_i + @aces.to_i
        @efficiency = ((@kills.to_f - @errors.to_f) / @attacks.to_f) * 100
      end
    end 
  end

  #Gets the number of match attack errors for a player
  def get_attack_errors(player)
    @errors=0
    errors = ['out','net','attack violation', 'foot fault', 'handling error', 'invasion', 'blocked']
    if @match_sets.any?
      @match_sets.each do |set|
        @touches = Touch.where("player_id = " + player.id.to_s + " AND touch_type = 'Attack' AND match_set_id = " + set.id.to_s)
          if @touches.each do |touch|
            if errors.include?(touch.touch_result)
              @errors+=1
            end
          end
        end 
      end
    end
  end

  #Calculates the match pass average for a player
  def get_pass_average(player)
    @passing_average = 0
    pass_list = []
    if @match_sets.any?
      @match_sets.each do |set|
        @passes = Touch.where("player_id = " + player.id.to_s + " AND touch_type = 'Pass' AND match_set_id = " + set.id.to_s)
        @passes.each do |pass|
          pass_list.push(pass.touch_result.to_i)
        end
      @passing_average = (pass_list.sum.to_i) / (pass_list.size.to_f)
      end
    end 
  end

  

end
