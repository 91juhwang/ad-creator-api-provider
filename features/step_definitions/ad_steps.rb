Given(/^a user with id "([^"]*)"$/) do |id|
  FactoryGirl.create(:user, id: id)
end

Given(/^an ad with id "([^"]*)"$/) do |id|
  FactoryGirl.create(:ad, id: id)
end

Given(/^following ads:$/) do |ads_table|
  ads_table.hashes.each do |ad_hash|
    FactoryGirl.create(:ad, ad_hash)
  end
end

Given(/^following users:$/) do |users_table|
  users_table.hashes.each do |user_hash|
    FactoryGirl.create(:user, user_hash)
  end
end

Given(/^following offers:$/) do |offers_table|
  offers_table.hashes.each do |offer_hash|
    FactoryGirl.create(:offer, offer_hash)
  end
end
When(/^I make a valid POST \/ads request with user_id: "([^"]*)"$/) do |user_id|
  params = valid_creation_params_for(:ad, user_id)
  post '/v1/ads', params
end

When(/^I make a POST \/ads request with blank title and user_id: "([^"]*)"$/) do |user_id|
  params = valid_creation_params_for(:ad, user_id).merge(title: '')
  post '/v1/ads', params
end

When(/^I make a valid POST \/ads\/(\d+)\/offers with user_id: "([^"]*)"$/) do |ad_id, user_id|
  params = valid_creation_params_for(:offer, user_id)
  post "/v1/ads/#{ad_id}/offers", params
end

When(/^I make a POST \/ads\/(\d+)\/offers request with blank price and user_id: "([^"]*)"$/) do |ad_id, user_id|
  params = valid_creation_params_for(:offer, user_id).merge(price: '')
  post "/v1/ads/#{ad_id}/offers", params
end                                                                                                                  
When(/^I make a GET \/ads$/) do
  get "/v1/ads"
end

When(/^I make a GET \/ads\/(\d)\/offers$/) do |ad_id|
  get "/v1/ads/#{ad_id}/offers"
end

Then(/^response should have status (\d+) and JSON:$/) do |status, json_string|
  expect(last_response.status).to be(status)
  expect(JSON.parse(last_response.body)).to eq(JSON.parse(json_string))
end