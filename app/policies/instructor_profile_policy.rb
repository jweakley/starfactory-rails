class InstructorProfilePolicy < Struct.new(:user, :instructor_profile)
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
      [:id, :name, :bio, :avatar, :user_id, user_attributes: [:id, :email]]
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
    !!user && (user.admin? || user == instructor_profile.user)
  end

  def edit?
    !!user && (user.admin? || user == instructor_profile.user)
  end

  def destroy?
    false
  end

  # Used by the admin controller
  def instructor_profiles?
    !!user && user.admin?
  end
end
