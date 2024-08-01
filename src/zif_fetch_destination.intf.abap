interface zif_fetch_destination
  public .

  types:
      destination_type type string.

  data type type destination_type read-only.
  data defaults type ref to ZIF_FETCH_DEFAULTS read-only.

  methods client
    returning value(client) type ref to zif_fetch_client
    raising cx_static_check.

endinterface.
