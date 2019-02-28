class BugPolicy < ApplicationPolicy
  attr_reader :user, :bug

  def initialize(user, bug)
    @user = user
    @bug = bug
  end

	def edit?
	   user_who_can_access_bug
 	end

  def update?
    # user_who_can_access_bug
  end

  def destroy?
    user.role == 'admin' || record.user == user
    user_who_can_access_bug
  end

  def user_who_can_access_bug
      record.user_id == user.id
  end
end