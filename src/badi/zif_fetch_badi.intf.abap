interface zif_fetch_badi
  public .
  interfaces if_badi_interface .

  methods fetch importing request type ref to zif_fetch_request returning value(response) type ref to zif_fetch_response raising cx_static_check.

endinterface.
