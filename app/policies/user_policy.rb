class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
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
