module EventHelper

  def registered_for_event?(event)
    if logged_in? && current_user.student?
      current_student_id = current_user.student_profile_id
      event.registrations.where{ student_profile_id.eq current_student_id }.any?
    else
      false
    end
  end
end
