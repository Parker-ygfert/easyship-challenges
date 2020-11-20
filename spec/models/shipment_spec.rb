require "rails_helper"

RSpec.describe Shipment, type: :model do
  let(:shipment) { FactoryBot.create(:shipment) }

  it 'returns grouped shipment items and ordered by count' do
    FactoryBot.create_list(:shipment_item, 1, description: 'Apple Watch', shipment_id: shipment.id)
    FactoryBot.create_list(:shipment_item, 2, description: 'iPhone', shipment_id: shipment.id)
    FactoryBot.create_list(:shipment_item, 3, description: 'iPad', shipment_id: shipment.id)

    group_items = shipment.set_shipment_items
    expect(group_items.first).to eq({ description: 'iPad', count: 3 })
    expect(group_items.second).to eq({ description: 'iPhone', count: 2 })
    expect(group_items.last).to eq({ description: 'Apple Watch', count: 1 })
  end
end
