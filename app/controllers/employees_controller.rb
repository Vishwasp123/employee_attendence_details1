class EmployeesController < ApplicationController
	
	before_action :set_employee, only: %i[show edit update destroy]

	before_action :set_company

	def index
		@employees = @company.employees
	end

	def new
		@employee = @company.employees.new
	end

	def create
		@employee = @company.employees.new(employee_params)
		if @employee.save
			redirect_to company_employee_path(@company, @employee), notice:"Emplyee create succesfully"
		else
			render :new , status: :unprocessable_entity
		end
	end

	def show
	end


	def edit
	end

	def update
		if @employee.update(employee_params)
		 redirect_to company_employee_path(@company, @employee), notice: 'Employee was successfully updated.'

		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		if @employee.destroy
			 redirect_to company_employees_path(@company), notice: 'Employee was successfully destroyed.'
		end
	end

	private

	def set_employee
		@employee = Employee.find(params[:id])
	end

	def employee_params
		params.require(:employee).permit(:first_name, :last_name, :gender, :email_address, :phone_number, :address, :employee_id, :password)
	end

	def set_company
		@company = Company.find(params[:company_id])
	end
end
