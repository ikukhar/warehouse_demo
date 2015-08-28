module ItemsHelper

  def count_percent item
    ((item.count.to_f/item.max_cell_count.to_f)*100).round.to_i
  end

  def percent_color percent
    case percent
    when 90..100
      'green'
    when 50..89
      'blue'
    when 15..49
      'orange'
    else
      'red'
    end
  end

end
