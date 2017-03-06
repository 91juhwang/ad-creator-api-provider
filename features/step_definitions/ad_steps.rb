Given(/^a user with id "([^"]*)"$/) do |id|
  FactoryGirl.create(:user, id: id)
end

When(/^the client makes a valid POST \/ads request with user_id: "([^"]*)"$/) do |id|
  params = FactoryGirl.attributes_for(:ad).merge(user_id: id)
  post '/v1/ads', params
end

Then(/^response should have status of (\d+) and JSON:$/) do |status, json_string|
  expect(last_response.status).to be(status)
  expect(JSON.parse(last_response.body)).to eq(JSON.parse(json_string))
end