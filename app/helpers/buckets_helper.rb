module BucketsHelper

  def percent_color(percent)
    case percent
    when 0...33 then 'green'
    when 33...66 then 'green'
    when 66...100 then 'orange'
    when 100..1/0.0 then 'red'
    end
  end

end
