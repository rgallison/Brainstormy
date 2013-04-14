FactoryGirl.define do
	factory :user do
		username 'testUser'
		name 'Test User'
		email 'tuser@gmail.com'
		password '1234'
		bio ''
	end
end