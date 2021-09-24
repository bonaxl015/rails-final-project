module EventsHelper
  def event_date_format(event_date)
    event_date.strftime('%a, %d %b %Y %I:%M %p')
  end

  def event_time(event_time)
    event_time.strftime('%I:%M %p')
  end

  def input_date_format(event_date)
    event_date.strftime('%a, %d %b %Y %I:%M')
  end

  def event_ongoing?(event)
    Time.zone.now.between?(event.start_date, event.end_date)
  end

  def event_ended?(event)
    event.end_date < Time.zone.now
  end
end
