interface zif_fetch_badi
  public .
  interfaces if_badi_interface .

  methods client
    importing destination   type ref to zif_fetch_destination
    returning value(client) type ref to zif_fetch_client
    raising   cx_static_check.

endinterface.
