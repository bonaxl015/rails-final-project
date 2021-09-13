module AttendsHelper
  def already_attending?
    Attend.where(user_id: current_user.id,
                 event_id: params[:event_id]).exists?
  end

  def attendee(event)
    event.attends.find do |attend|
      attend.user_id == current_user.id
    end
  end

  def kick_attendee(event, attendee_id)
    event.attends.find do |attend|
      attend.user_id == attendee_id
    end
  end
end
