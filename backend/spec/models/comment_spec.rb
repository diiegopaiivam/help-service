require 'rails_helper'

RSpec.describe Comment, :type => :model do 
  Rails.application.load_seed #Carrega os dados de seed

  describe 'Validation with Comments' do 
    context 'with invalid comments' do
      let(:comment) { build(:comment, description: 'sdsa') }
      let(:commentnilemployee) { build(:comment, employee_id: 0) }

      it "Not possible create comment with lower 5 character" do
        expect(comment).to_not be_valid
      end

      it "Not possible create comment with employee nil" do
        expect(commentnilemployee).to_not be_valid
      end

    end

    context 'with comment valid' do
      let(:comment) { create(:comment) }
      it 'is valid' do
        expect(comment).to be_valid
      end
    end
  end
end
