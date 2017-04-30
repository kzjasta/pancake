module TouchesHelper

  #Takes in a touch and determines whether it is a point or a foul
  def is_it_a_point?(touch)
    point = ["kill","kill block", "ace",]
    foul = ["out","net fault","attack violation", "net", "foot fault", 
           "handling error", "invasion", "illegal blocker", "rotation fault", "red card"]
    if point.include? touch.touch_result
      return true
    elsif foul.include? touch.touch_result
      return false
    end
  end
end
