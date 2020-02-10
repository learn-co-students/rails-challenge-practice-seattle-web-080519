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
    @employee = Employee.new(employee_params)
    @employee.save
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
      flash[:flash_errors] = "Company not created"
      puts @company.errors.full_messages
      render :new
    end
  end

  def edit
    find_company
  end

  def update
    find_company
    if @company.update(company_params)
      params[:company][:offices_attributes].each do |key, building_data|
        @building = Building.find(building_data[:id])
        if @building
          @floors = (building_data[:offices]-[""]).map{|x|x.to_i}
          @floors.each do |floor|
            if @building.floors_rented.none?(floor)
              Office.create(building: @building, company: @company, floor: floor)
            end
          end
          @company_floors = @building.current_company_floors(@company.id)
          deleted_floors = @company_floors - @floors
          deleted_floors.each do |df|
            Office.delete(Office.where(building_id: @building.id, floor: df))
          end
        end
      end
      flash[:success] = "Company successfully updated"
      redirect_to company_path(@company)
    else
      flash[:flash_errors] = "Company not updated, #{@company.errors.full_messages}"
      render :edit
    end
  end
  
  private 

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, offices_attributes:[])
  end

  def employee_params
    params.require(:employee).permit(:name, :title, :company_id)
  end

end