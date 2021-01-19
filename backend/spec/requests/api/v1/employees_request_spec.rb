require 'rails_helper'

RSpec.describe "Api::V1::Employees", type: :request do
    describe "GET /employeers" do
        it "return success status" do
            get api_v1_employees_path
            expect(response).to have_http_status(200)
        end
    end

    describe "POST /employees" do
        context "when it has valid parameters" do
            it "creates the employee with correct attributes" do
                employee_attributes = FactoryBot.attributes_for(:employee)
                post api_v1_employees_path, params: { employee: employee_attributes }
                expect(Employee.last).to have_attributes(employee_attributes)
            end
        end
    end
end
