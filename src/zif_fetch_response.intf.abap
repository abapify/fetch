interface zif_fetch_response
  public .

  interfaces zif_fetch_entity.

  methods status returning value(result) type i.
  methods status_text returning value(result) type string.

  methods body returning value(result) type xstring.
  methods text returning value(result) type string.

  methods headers returning value(headers) type zif_fetch_entity~header_tt.
  methods header importing name type string returning value(value) type string.

endinterface.
