interface zif_fetch_client
  public .

  methods request returning value(result) type ref to zif_fetch_request_setter.
  methods fetch   importing request type ref to zif_fetch_request returning value(response) type ref to zif_fetch_response raising cx_static_check.

  events request_created exporting value(request) type ref to zif_fetch_request.

endinterface.
