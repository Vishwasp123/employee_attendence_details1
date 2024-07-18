class EmployeesController < ApplicationController
	
	before_action :set_employee, only: %i[show edit update destroy]

	def index
		@employees = Employee.all
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			redirect_to @employee
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
			redirect_to @employee
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		if @employee.destroy
			redirect_to @employees
		end
	end

	private

	def set_employee
		@employee = Employee.find(params[:id])
	end

	def employee_params
		params.require(:employee).permit(:first_name, :last_name, :gender, :email_address, :phone_number, :address, :employee_id, :latitude, :longitude)
	end
end
