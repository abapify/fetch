interface zif_fetch_request
  public .

  interfaces zif_fetch_entity_readable.

  aliases body for zif_fetch_entity_readable~body.
  aliases text for zif_fetch_entity_readable~text.
  aliases headers for zif_fetch_entity_readable~headers.
  aliases header for zif_fetch_entity_readable~header.

  methods path returning value(result) type string.
  methods method returning value(result) type string.

endinterface.
