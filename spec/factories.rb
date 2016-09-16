FactoryGirl.define do

  factory :incident_report do
    description "MyText"
    usable true

    association :user, factory: :user
		association :device, factory: :device
  end

	factory :loan do
		active true
		signature "text"

		association :user, factory: :user
		association :device, factory: :device
		association :group, factory: :group
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