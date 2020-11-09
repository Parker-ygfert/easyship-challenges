require 'aftership'

class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end

  def show
    @shipment = Shipment.find(params[:id])
    AfterShip.api_key = ENV['AFTERSHIP_API_KEY']
    @tracking = AfterShip::V4::Tracking.get(@shipment.slug, @shipment.tracking_number)['data']['tracking']
  end
end
