interface zif_fetch_destination_cloud
  public .
  interfaces zif_fetch_destination.
  data destination type string read-only.
  constants type type zif_fetch_destination~destination_type value 'CLOUD_DEST'.
endinterface.
