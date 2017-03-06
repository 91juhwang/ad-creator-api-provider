Given(/^a user with id "([^"]*)"$/) do |id|
  FactoryGirl.create(:user, id: id)
end

When(/^the client makes a valid POST \/v(\d+)\/ads request with user_id: "([^"]*)"$/) do |version, id|
  params = valid_ad_creation_params(id)
  post "/v#{version}/ads", params
end

Then(/^response should have status of (\d+) and JSON:$/) do |status, json_string|
  expect(last_response.status).to be(status)
  expect(JSON.parse(last_response.body)).to eq(JSON.parse(json_string))
end

When(/^the client makes a POST \/v(\d+)\/ads request with blank title and user_id: "([^"]*)"$/) do |version, id|
  params = valid_ad_creation_params(id).merge(title: '')
  post "/v#{version}/ads", params
end