require 'rails_helper'

RSpec.describe "Api::V1::Ratings", type: :request do
    describe "GET /ratings" do
        it "return success status" do
            get api_v1_employees_path
            expect(response).to have_http_status(200)
        end
    end
end
