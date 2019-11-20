class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    find_company
    @employee = Employee.new
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to companies_path
    else
      puts @company.errors.full_messages
      render :new
    end
  end

  def edit
    find_company
  end

  def update
    find_company
    if @company.employees.create(employee_params) && @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    find_company
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to company_path(@company)
  end

  def add_employee
    @company = Company.find(params[:employee][:company_id])
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to company_path(@company.id)
    else
      puts "Error in add employee, #{@employee.errors.full_messages}"
      redirect_to company_path(@company.id)
    end
  end


  private 

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name)
  end

  def employee_params
    params.require(:employee).permit(:name, :title, :company_id)
  end

end