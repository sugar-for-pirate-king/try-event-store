Rails.configuration.to_prepare do
  Rails.configuration.event_store = $event_store = RailsEventStore::Client.new
  $event_store.subscribe(UserCreatedHandler.new, to: [UserCreated])
  $event_store.subscribe(UserActivatedHandler.new, to: [UserActivated])
end