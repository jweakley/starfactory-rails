class TrackPolicy < Struct.new(:user, :track)
  class Scope < Struct.new(:user, :scope)
    def resolve
      case
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
      [:name, :status]
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
    user.admin?
  end

  def new?
    user.admin?
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    false
  end
end
