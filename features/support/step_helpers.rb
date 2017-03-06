Transform /(\d+)$/ do |number|
  number.to_i
end

def valid_ad_creation_params(user_id)
  FactoryGirl.attributes_for(:ad).merge(user_id: user_id)
end