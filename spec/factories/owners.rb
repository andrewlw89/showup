FactoryGirl.define do
	sequence :email do |n|
		"person#{n}@gmail.com"
	end
end

FactoryGirl.define do
  factory :owner, :class => 'Owner' do
    email
    password '12345678'
    password_confirmation '12345678'
  end
end