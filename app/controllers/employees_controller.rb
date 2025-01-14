class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update]

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to @employee
        else
            flash[:error] = @employee.errors.full_messages
            redirect_to new_employee_path(@employee) 
        end
        
    end

    def edit
        @dogs = Dog.all
    end

    def update
        @employee.assign_attributes(employee_params)
        if @employee.save
            redirect_to @employee
        else
            flash[:error] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee) 
        end

    end

    def show
        @dog = @employee.dog
    end

    private

    def set_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
