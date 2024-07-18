class AttendancesController < ApplicationController
  before_action :set_employee
  before_action :set_attendance, only: %i[show edit update destroy]

  def index
    @attendances = @employee.attendances
  end

  def show
  end

  def new
    @attendance = @employee.attendances.new
  end

  def edit
  end

  def create
    @attendance = @employee.attendances.new(attendance_params)
    if @attendance.save
      redirect_to employee_attendance_path(@employee, @attendance), notice: "Attendance was successfully created"
    else
      render :new
    end
  end

  def update
    if @attendance.update(attendance_params)
      redirect_to employee_attendance_path(@employee, @attendance), notice: "Attendance was successfully updated"
    else
      render :edit 
    end
  end

  def destroy
    @attendance.destroy
    redirect_to employee_attendances_path(@employee), notice: 'Attendance was successfully destroyed.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_attendance
    @attendance = @employee.attendances.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:employee_id, :date, :check_in_time, :check_out_time, :status)
  end
end
