class EmployeesController < ApplicationController

  def index
    @employee = Employee.all
  end

  def show
    find_employee
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee successfully created"
      redirect_to company_path(@employee.company_id)
    else
      byebug
      flash[:error] = "Error in employee Create, #{@employee.errors.full_messages}"
      puts @employee.errors.full_messages
      redirect_to request.referer
    end
  end

  def destroy
    find_employee
    if @employee.destroy
      flash[:success] = "Employee successfully deleted"
    else
      flash[:error] = "Employee not deleted"
    end
    redirect_to request.referrer
  end

  private
  
  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :title, :company_id)
  end

end