# making an alias of it 'should blah blah' to simple :it_responds_with
RSpec.configure do |c|
  c.alias_it_should_behave_like_to :it_responds_with, 'responds with'
end

shared_context 'permit_params' do
  let(:permitted_params) { ActionController::Parameters.new(params) }
  before(:all) do
    ActionController::Parameters.permit_all_parameters = true
  end
end

# sharing context 'a success status' represents the below expectation
shared_context 'a success status' do
  it { expect(response).to have_http_status(:success) }
end

# creating shared context for response body section
shared_context 'JSON body' do |json|
  it { expect(JSON.parse(response.body)).to eq(JSON.parse(json)) }
end