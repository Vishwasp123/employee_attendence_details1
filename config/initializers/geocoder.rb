# config/initializers/geocoder.rb
Geocoder.configure(
  # Geocoding options
  # timeout: 5,                 # geocoding service timeout (secs)
  lookup: :nominatim,         # name of geocoding service (symbol)
  ip_lookup: :ipinfo_io,      # name of IP address geocoding service (symbol)
  language: :en,              # ISO-639 language code
  use_https: true,            # use HTTPS for lookup requests? (if supported)
  units: :km,                 # :km for kilometers or :mi for miles

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  always_raise: [SocketError, Timeout::Error],

  # Calculation options
  distances: :linear          # :linear or :spherical
)
