class EventPolicy < Struct.new(:user, :event)
  class Scope < Struct.new(:user, :scope)
    def resolve
      case
      when !user
        none
      when user.admin?
        scope
      else
        none
      end
    end
  end

  def permitted_attributes
    case
    when user.admin?
      [:starts_at, :starts_at_day, :starts_at_time, :ends_at, :ends_at_day,
        :ends_at_time, :registrations_max, :cost_in_cents, :cost_in_dollars,
        :workshop_id, :status, :instructor_profile_ids => []]
    else
      []
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    !!user && user.admin?
  end

  def new?
    !!user && user.admin?
  end

  def update?
    !!user && user.admin?
  end

  def edit?
    !!user && user.admin?
  end

  def destroy?
    false
  end

  # Used by the admin controller
  def events?
    !!user && user.admin?
  end
end
