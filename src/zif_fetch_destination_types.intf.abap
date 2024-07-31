interface ZIF_FETCH_DESTINATION_TYPES
  public .

  types: destination_type type zif_fetch_destination=>destination_type.

  constants:
    begin of destination_types,
      url   type destination_type value zif_fetch_destination_url=>type,
      rfc   type destination_type value zif_fetch_destination_rfc=>type,
      cloud type destination_type value zif_fetch_destination_cloud=>type,
    end of destination_types.

endinterface.
