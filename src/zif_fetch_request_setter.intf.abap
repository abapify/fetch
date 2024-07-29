interface zif_fetch_request_setter
  public .

  interfaces zif_fetch_request.
  interfaces zif_fetch_entity_writeable.

  methods method
    importing method type string.

  methods path
    importing path type string.

  aliases body for zif_fetch_entity_writeable~body.
  aliases text for zif_fetch_entity_writeable~text.
  aliases headers for zif_fetch_entity_writeable~headers.
  aliases header for zif_fetch_entity_writeable~header.

endinterface.
