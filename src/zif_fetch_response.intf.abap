interface zif_fetch_response
  public .

  interfaces zif_fetch_entity_readable.

  methods status returning value(result) type i.
  methods status_text returning value(result) type string.

  aliases body for zif_fetch_entity_readable~body.
  aliases text for zif_fetch_entity_readable~text.
  aliases headers for zif_fetch_entity_readable~headers.
  aliases header for zif_fetch_entity_readable~header.

endinterface.
