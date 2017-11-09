module ConversationsHelper
  
  def show_date (date)
    if date.day == Date.today.day
      date.strftime("%H:%M")
    elsif date.year != Date.today.year
      date.strftime("%d %b %y")
    else
      date.strftime("%d %b")
    end
  end
end
