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

        context "when it has no valid parameters" do
            it "does not create employee" do
                expect{ 
                    post api_v1_employees_path, params: { employee: { first_name: '', last_name: '', email: '', phone: '', latitude: '', longitude: '', profession_id: '', image: '' }}
                }.to_not change(Employee, :count)
            end
        end
    end

    describe "PUT /employees" do
        context "when the employee exists" do 

            let(:employee) { create(:employee) }
            let(:employee_attributes) { attributes_for(:employee) }

            before(:each) { put "/api/v1/employees/#{employee.id}", params: { employee: employee_attributes} }

            it "return status code 200" do 
                expect(response).to have_http_status(200)
            end

        end

    end


end
