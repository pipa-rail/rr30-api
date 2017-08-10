class SourceProviderResource < JSONAPI::Resource
  attributes :name, :url, :address, :active

  filter :active, default: true
end
