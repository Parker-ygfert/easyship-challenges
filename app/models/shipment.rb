class Shipment < ApplicationRecord
  belongs_to :company
  has_many :shipment_items

  def group_shipment_items
    shipment_items.group(:description).order('count_all desc').count
  end

  def set_shipment_items
    group_shipment_items.map do |item, count|
      {description: item, count: count}
    end
  end
end
