interface zif_fetch_destination
  public .

  types:
      destination_type type string.

  constants:

    begin of destination_types,
      url   type destination_type value zif_fetch_destination_url=>type,
      rfc   type destination_type value zif_fetch_destination_rfc=>type,
      cloud type destination_type value zif_fetch_destination_cloud=>type,
    end of destination_types.

  data type type destination_type read-only.

  methods client
    returning value(client) type ref to zif_fetch_client
    raising cx_static_check.


endinterface.
