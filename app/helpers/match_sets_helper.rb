module MatchSetsHelper

  #Checks which set score is higher
  def checkScore(score1, score2)
    if score1 > score2
      return true
    else
      return false
    end
  end

end