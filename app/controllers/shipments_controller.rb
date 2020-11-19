class ShipmentsController < ApplicationController
  before_action :set_company, only: :show

  def index
    @shipments = Shipment.all
  end

  def show
    @shipment = Shipment.find(params[:id])
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end
end
