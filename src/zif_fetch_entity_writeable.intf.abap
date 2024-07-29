interface zif_fetch_entity_writeable
  public .

  methods body
    importing body type xstring.

  methods text
    importing text type string.

  methods headers
    importing headers type zif_fetch_entity=>header_tt.

  methods header
    importing
        name type zif_fetch_entity=>header_ts-name
        value type zif_fetch_entity=>header_ts-value.

endinterface.
