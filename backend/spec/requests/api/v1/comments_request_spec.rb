require 'rails_helper'

RSpec.describe "Api::V1::Comments", type: :request do


  context "when the comment exists" do 

    let(:comment) { create(:comment) }
    let(:comment_attributes) { attributes_for(:comment) }

    before(:each) { patch "/api/v1/comments/#{comment.id}", params: { comment: comment_attributes} }

    it "return status code 200" do 
        expect(response).to have_http_status(200)
    end

  end


  context "when the comments exists" do
    

    let(:comment) { create(:comment) }
    before(:each) { delete "/api/v1/comments/#{comment.id}" }

    it "return status code 200" do
        expect(response).to have_http_status(204)
    end


end

end
