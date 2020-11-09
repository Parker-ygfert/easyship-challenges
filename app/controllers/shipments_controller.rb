require 'aftership'

class ShipmentsController < ApplicationController
  before_action :set_company

  def index
    @shipments = @company.shipments.includes(:shipment_items)
  end

  def show
    @shipment = @company.shipments.find(params[:id])
    AfterShip.api_key = ENV['AFTERSHIP_API_KEY']
    @tracking = AfterShip::V4::Tracking.get(@shipment.slug, @shipment.tracking_number)['data']['tracking']
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end
end
