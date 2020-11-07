class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all
  end

  def show
    @shipment = Shipment.find(params[:id])
  end
end
