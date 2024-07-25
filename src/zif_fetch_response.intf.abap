interface zif_fetch_response
  public .

  interfaces zif_fetch_entity.

  data status type i read-only.
  data status_text type string read-only.

  methods body returning value(result) type xstring.
  methods text returning value(result) type string.

  methods headers returning value(headers) type zif_fetch_entity~header_tt.
  methods header importing name type string returning value(value) type string.

endinterface.
