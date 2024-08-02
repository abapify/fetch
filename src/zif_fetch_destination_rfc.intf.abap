interface zif_fetch_destination_rfc
  public .
  interfaces zif_fetch_destination.
  data destination type rfcdest read-only.
  constants type type zif_fetch_destination~destination_type value 'RFC'.
  aliases defaults for zif_fetch_destination~defaults.
endinterface.
