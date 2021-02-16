require 'rails_helper'

RSpec.describe "Api::V1::Comments", type: :request do

  describe "POST /comments" do
    context "when it has valid parameters" do
      let(:comment_attributes) { attributes_for(:comment) }

      it "creates the comment with correct attributes" do
        post api_v1_comments_path, params: { comment: comment_attributes }
        expect(Comment.last).to have_attributes(comment_attributes)
      end

      it "created the comment and return http status 201" do
        post api_v1_comments_path, params: { comment: comment_attributes }
        expect(response).to have_http_status(201)
      end 
    end 
  end 

  describe "PUT /comments" do
    context "when the comment exists" do 

      let(:comment) { create(:comment) }
      let(:comment_attributes) { attributes_for(:comment) }
  
      before(:each) { patch "/api/v1/comments/#{comment.id}", params: { comment: comment_attributes} }
  
      it "return status code 200" do 
          expect(response).to have_http_status(200)
      end
  
    end
  end

  describe "DELETE /comments" do
    context "when the comments exists" do
    
      let(:comment) { create(:comment) }
      before(:each) { delete "/api/v1/comments/#{comment.id}" }
  
      it "return status code 200" do
          expect(response).to have_http_status(204)
      end
  
    end
  end 

end
