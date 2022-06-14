class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    user.admin? || user == record
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
