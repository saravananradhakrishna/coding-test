class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new, :update, :destroy]
  before_action :update_location, only: [:create, :update]
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Changes Saved"
    else
      render :edit
    end
  end  
  def destroy
    if @company.destroy
      redirect_to companies_path, notice: "Company #{@company.name} has been destroyed sucessfully"
    else
      render :edit
    end
  end  
  def update_location
    zip = ZipCodes.identify(@company.zip_code)
    @compay.city = zip.city
    @compay.state = zip.state
  end  

  private

  def company_params
    params.require(:company).permit(
      :name,
      :legal_name,
      :description,
      :zip_code,
      :phone,
      :email,
      :owner_id,
      :city,
      :state
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end
  
end
