interface zif_fetch
  public .

  methods fetch
    importing
        " default
        " string or http request or fetch request
        path type string optional
        method type string default 'GET'
        headers type zif_fetch_entity=>header_tt optional
        body type xstring optional
        preferred parameter path
    returning value(response) type ref to zif_fetch_response
    raising cx_static_check.

endinterface.
