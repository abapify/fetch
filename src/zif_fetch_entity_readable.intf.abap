interface zif_fetch_entity_readable
  public .

  methods body returning value(result) type xstring.
  methods text returning value(result) type string.
  methods headers returning value(headers) type zif_fetch_entity=>header_tt.
  methods header importing name type string returning value(value) type string.

endinterface.
