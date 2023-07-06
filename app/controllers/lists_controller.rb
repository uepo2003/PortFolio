class ListsController < ApplicationController

  def index
    @companies = Company.page(params[:page])
  end

  def show
   @company = Company.find(params[:id])
  end
  
  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    if policy(@company).create?
      redirect_to "/lists"
    else
      flash[:notice] = "You do not have permission to create this page."
      redirect_to new_list_path
    end
    
  end 

  def new
    @company = Company.new
  end
  
  def edit
    @company = Company.find(params[:id])
    if policy(@company).edit?
    else
    flash[:notice] = "You do not have permission to edit this company."
    redirect_to lists_path
    end
      
  end
  
  def update
    company = Company.find(params[:id])
    company.update(company_params)
    company.save
  end 
  
  def destroy
  company = Company.find(params[:id])
  
  if policy(company).destroy?
    company.destroy
    flash[:notice] = "Company was successfully destroyed."
    redirect_to lists_path
  else
    flash[:notice] = "You do not have permission to delete this company."
    redirect_to lists_path
  end
  end
  
  private
  def company_params
    params.require(:company).permit(
  :company_code,
  :listing_status,
  :company_name,
  :company_name_kana,
  :mail_address,
  :address,
  :representative,
  :representative_kana,
  :phone_nubmer,
  :earnings_2022,
  :profit_2022,
  :earnings_2021,
  :profit_2021,
  :earnings_2020,
  :profit_2020
)
  end

end
