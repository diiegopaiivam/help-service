require 'rails_helper' 

RSpec.describe Employee, :type => :model do 
    describe 'Validations with Employeers' do
        context 'with invalid employee' do
            let(:employee) { build(:employee, email: 'diiegopaiivam@gmail.com') }

            employee2 = Employee.create(first_name: 'Diego', last_name: 'Paiva', email: 'diiegopaiivam@gmail.com', 
                phone: '85992777480', latitude: 'fsdifhsdifh', longitude: 'oifosdjfijsdf', profession_id: 1)            
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