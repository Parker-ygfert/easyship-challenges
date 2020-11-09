require "rails_helper"

RSpec.describe Shipment, type: :model do
  let(:company) { Company.create(name: 'New Co') }
  subject { described_class.create(company: company) }

  before do
    subject.shipment_items.create(
      description: 'Apple Watch',
      shipment: subject
    )
    2.times do
      subject.shipment_items.create(
        description: 'iPhone',
        shipment: subject
      )
    end
    3.times do
      subject.shipment_items.create(
        description: 'iPad',
        shipment: subject
      )
    end
  end

  it 'test' do
    group_items = subject.group_shipment_items
    expect(group_items.first).to eq({ description: 'iPad', count: 3 })
    expect(group_items.second).to eq({ description: 'iPhone', count: 2 })
    expect(group_items.last).to eq({ description: 'Apple Watch', count: 1 })
  end
end
