class Shipment < ApplicationRecord
  belongs_to :company
  has_many :shipment_items

  def group_shipment_items
    shipment_items.group(:description).order('count_all desc').count.map do |item|
      {description: item[0], count: item[1]}
    end
  end
end
