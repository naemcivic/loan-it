FactoryGirl.define do
  factory :incident_report do
    description "MyText"
    useable false
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
		id_number "3"
	end

  factory :group do
		name "Honda"
	end
end