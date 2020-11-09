json.shipment do
  json.company_id             @shipment.company.uuid
  json.destination_country    @tracking['destination_country_iso3']
  json.origin_country         @tracking['origin_country_iso3']
  json.tracking_number        @tracking['tracking_number']
  json.slug                   @tracking['slug']
  json.created_at             @tracking['created_at'].to_datetime.strftime('%A, %d %B %Y at%l:%M %p')

  if !@tracking['checkpoints'].blank?
    json.tracking do
      json.status                  @tracking['checkpoints'][0]['tag']
      json.current_location        @tracking['checkpoints'][0]['location']
      json.last_checkpoint_message @tracking['checkpoints'][0]['message']
      json.last_checkpoint_time    @tracking['checkpoints'][0]['checkpoint_time'].to_datetime.strftime('%A, %d %B %Y at%l:%M %p')
    end
  else
    json.tracking 'no tracking information is available yet!'
  end
end
