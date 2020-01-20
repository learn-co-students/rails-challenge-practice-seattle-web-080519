class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    find_company
    @employee = Employee.new
    byebug
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      params[:company][:offices_attributes].each do |k, building_data|
        @building = Building.find(building_data[:id])
        if @building
          @floors = building_data[:offices]
          @floors.each do |floor|
            if !floor.empty?
              Office.create(building: @building, company: @company, floor: floor)
            end
          end
        end
      end
      flash[:success] = "Company successfully created"
      redirect_to company_path(@company)
    else
      flash[:error] = "Company not created"
      puts @company.errors.full_messages
      render :new
    end
  end

  def edit
    find_company
  end

  def update
    # if employees is in params, do this way, else
    find_company
    @company.offices_attributes << params[:company][:offices_attributes]
    if params[:employees].nil?
      if @company.update(company_params)
        flash[:success] = "Company successfully updated"
        redirect_to company_path(@company)
      else
        flash[:error] = "Company not updated"
        render :edit
      end
    else 
      if @company.employees.create(employee_params) && @company.update(company_params)
        flash[:success] = "Company successfully updated"
        redirect_to company_path(@company)
      else
        flash[:error] = "Company not updated"
        puts @company.errors.full_messages
        render :edit
      end
    end
  end

  # def destroy
  #   @company = Company.find(params[:id])
  #   if @company.destroy
  #     flash[:success] = "Company successfully deleted"
  #   else
  #     flash[:error] = "Company not deleted"
  #   end
  #   redirect_to request.referrer
  # end

  # def add_employee
  #   @company = Company.find(params[:employee][:company_id])
  #   @employee = Employee.new(employee_params)
  #   if @employee.save
  #     flash[:success] = "Employee successfully added"
  #     redirect_to company_path(@company.id)
  #   else
  #     flash[:error] = "Employee not added"
  #     puts "Error in add employee, #{@employee.errors.full_messages}"
  #     redirect_to company_path(@company.id)
  #   end
  # end

  private 

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, offices_attributes: [])
  end

end