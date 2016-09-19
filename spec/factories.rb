FactoryGirl.define do

  factory :incident_report do
    description "MyText"
    usable true

    association :user, factory: :user
		association :device, factory: :device
  end

	factory :loan do
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
		group_id 3
	end

  factory :group do
		name "Honda"
	end
end