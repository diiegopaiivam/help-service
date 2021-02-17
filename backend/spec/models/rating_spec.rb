require 'rails_helper'

RSpec.describe Rating, :type => :model do 
  Rails.application.load_seed #Carrega os dados de seed

  describe 'Validation with Ratings' do 
    context 'with invalid ratings' do
      #before(:each) { create_list(:rating, 5, classification: 15) }

      let(:rating) { build(:rating, classification: 15) }
      let(:ratingnilemployee) { build(:rating, :employee_id => nil) }

      it "Not possible create rating with classification higher 10" do
        expect(rating).to_not be_valid
      end

      it "Not possible create rating for employee nil" do
        expect(ratingnilemployee).to_not be_valid
      end

    end

    context 'with rating valid' do
      let(:rating) { create(:rating) }

      it "is valid" do
        expect(rating).to be_valid
      end
    end
  end

end
