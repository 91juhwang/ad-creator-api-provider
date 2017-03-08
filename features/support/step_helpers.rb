module StepHelpers
  def valid_creation_params_for(resource, user_id)
    FactoryGirl.attributes_for(resource).merge(user_id: user_id)
  end
end

Transform /(\d+)$/ do |number|
  number.to_i
end
World(StepHelpers)