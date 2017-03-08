require 'rails_helper'

RSpec.describe Offer, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:ad) }
  it { should validate_presence_of(:price) }
  describe '.all' do
    before { FactoryGirl.create(:offer, id: 1, price: 3) }
    let(:offer_attributes) { Offer.all.first.attributes }
    it 'includes default offer attributes' do
      expect(offer_attributes).to include('id', 'message', 'price', 'user_id')
    end
    it 'includes 4 attributes' do
      expect(offer_attributes.count).to be(4)
    end
    it 'sorts by price descending' do
      FactoryGirl.create(:offer, id: 2, price: 8)
      FactoryGirl.create(:offer, id: 3, price: 5)
      expect(Offer.all.collect(&:id)).to eq([2, 3, 1])
    end
  end
end