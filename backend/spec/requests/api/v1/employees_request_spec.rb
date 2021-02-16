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

            let(:employee_attributes) { attributes_for(:employee) }
            it "creates the employee with correct attributes" do
                post api_v1_employees_path, params: { employee: employee_attributes }
                expect(Employee.last).to have_attributes(employee_attributes)
            end
        end

        context "when it has invalid parameters" do
            it "does not create employee" do
                expect{
                    post api_v1_employees_path, params: { employee: { :first_name => nil, :last_name => nil, :phone => nil, 
                        :email => nil, :latitude => nil, :longitude => nil }}
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

            it "updates the employee" do
                expect(employee.reload).to have_attributes(employee_attributes)
            end


        end

        context "when the employee does not exists" do
            let(:employee_attributes) { attributes_for(:employee) }
            before(:each) { patch "/api/v1/employees/0", params: { employee: employee_attributes } }

            it "return status code 404" do
                expect(response).to have_http_status(404)
            end

            it "return a not found message" do
                expect(response.body).to match(/Couldn't find Employee/)
            end
        end

    end

    describe "DELETE /employees" do 
        context "when the employee exists" do

            let(:employee) { create(:employee) }
            before(:each) { delete "/api/v1/employees/#{employee.id}" }

            it "return status code 204" do
                expect(response).to have_http_status(204)
            end

            it "destroy the record" do
                expect { employee.reload }.to raise_error ActiveRecord::RecordNotFound
            end

        end

        context "when the employee does not exists" do
            before(:each) { delete "/api/v1/employees/0" }

            it "return status code 404" do
                expect(response).to have_http_status(404)
            end

            it "return a not found message" do
                expect(response.body).to match(/Couldn't find Employee/)
            end
        end
    end


end
