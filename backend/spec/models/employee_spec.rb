require 'rails_helper' 


RSpec.describe Employee, :type => :model do 
    Rails.application.load_seed #Carrega os dados de seed
    describe 'Validations with Employeers' do
        context 'with invalid employee' do
            #Criação dos objetos para validações
            let(:employee) { build(:employee, email: 'diiegopaiivam@gmail.com') }
            let(:employee_false_number) { build(:employee, phone: '92777480') }
            before(:each) { create(:employee, phone: '8592777480') }
            ##

            employee2 = Employee.create(first_name: 'Diego', last_name: 'Paiva', email: 'diiegopaiivam@gmail.com', 
                phone: '85992777480', latitude: 'fsdifhsdifh', longitude: 'oifosdjfijsdf', profession_id: 1)   
                
            # testes
            it "not possible create more one employee with only email" do
                expect(employee2).to_not be_valid
            end

            it "not possible create more one employee with only phone number" do
                expect(employee2).to_not be_valid
            end

            it "phone number must have 11 digits" do
                expect(employee_false_number).to_not be_valid
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