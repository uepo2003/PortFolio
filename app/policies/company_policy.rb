class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
   
    

 
  end
  def create?
  
    user.admin?
  end
   def new?
    user.admin?
   end


  def destroy?
     user.admin?
  end
end
