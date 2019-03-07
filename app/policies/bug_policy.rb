class BugPolicy < ApplicationPolicy
  attr_reader :user, :bug

  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def index?
    restricted_access
  end

  def show?
    restricted_access
  end

  def create?
    admin_access
  end

  def edit?
    admin_access
  end

  def new?
    admin_access
  end
  
  def update?
    admin_access
  end

  def destroy?
    admin_access
  end

  def admin_access
    true if user.present? && (user.pm? || user.admin?)
  end

  def restricted_access
    true if user.present? && (user.pm? || user.admin? || user.dev?)
  end
end