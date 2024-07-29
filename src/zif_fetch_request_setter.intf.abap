interface zif_fetch_request_setter
  public .

  interfaces zif_fetch_request.

  methods method
    importing method like zif_fetch_request~method.

  methods path
    importing path like zif_fetch_request~path.

  methods body
    importing body like zif_fetch_request~body.

  methods headers
    importing headers like zif_fetch_request~headers.

  methods header
    importing
        name type zif_fetch_entity=>header_ts-name
        value type zif_fetch_entity=>header_ts-value.

endinterface.
