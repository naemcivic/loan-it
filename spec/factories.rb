FactoryGirl.define do
  factory :qr_code do
    
  end

  factory :incident_report do
    description "MyText"
    useable true

    association :user, factory: :user
		association :device, factory: :device
  end

	factory :loan do
		active true
		signature "text"

		association :user, factory: :user
		association :device, factory: :device
	end

	factory :user do
		email "something@something.ca"
		password "password"
		password_confirmation "password"
	end

	factory :device do
		name "iPad"
	end

  factory :group do
		name "Honda"
	end
end