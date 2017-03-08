require 'rails_helper'

RSpec.describe Ad, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  describe '.all' do
    before { FactoryGirl.create(:ad) }
    let(:ad_attributes) { Ad.all.first.attributes }
    it 'includes default attributes attribute' do
      expect(ad_attributes).to include('id', 'title', 'description', 'price')
    end
    it 'includes 4 attributes' do
      expect(ad_attributes.count).to be(4)
    end
  end
end