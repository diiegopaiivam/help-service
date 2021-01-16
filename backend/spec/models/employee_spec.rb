require 'rails_helper' 

RSpec.describe Employee, :type => :model do 
    describe 'Validations with Employeers' do
        context 'with invalid employee' do
            let(:employee) { build(:employee, email: 'diiegopaiivam@gmail.com') }
            let(:employee2) { build(:employee, email: 'diiegopaiivam@gmail.com') }
            
            it "not possible create more one employee with only email" do
                expect(employee2).to_not be_valid
            end
        end

        context 'with employee valid' do
            let(:employee) { build(:employee) }
            
            it 'is valid' do
              expect(employee).to be_valid
            end
        end
    end
end