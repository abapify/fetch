interface zif_fetch_destination_url
  public .
  interfaces zif_fetch_destination.
  data url type string read-only.
  constants type type zif_fetch_destination~destination_type value 'URL'.
  aliases defaults for zif_fetch_destination~defaults.
endinterface.
