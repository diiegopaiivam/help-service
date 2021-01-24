class Api::V1::EmployeesController < Api::V1::ApiController
    before_action :set_employee, only: [:update, :destroy]
    
    def index
        @employeers = Employee.includes(:comments, :ratings).page(params[:page])
        render json: @employeers
        #render 'employees/index.json.jbuilder'
    end

    def show 
        @employee = Employee.includes(:comments, :ratings).find(params[:id])
        render json: @employee
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            render json: @employee, status: :created
        else  
            render json: @employee.errors, status: :unprocessable_entity
        end
    end

    def update
        if @employee.update(employee_params)
            render json: @employee
        else 
            render json: @employee.errors, status: :unprocessable_entity
        end

    end

    def destroy 
        @employee.destroy
    end

    private 
        def employee_params
            params.require(:employee).permit(:first_name, :last_name, :email, :phone, :image, :latitude, :longitude, :profession_id)
        end

        def set_employee
            @employee = Employee.find(params[:id])
        end
end
