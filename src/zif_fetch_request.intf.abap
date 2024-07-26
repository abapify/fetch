interface zif_fetch_request
  public .

  interfaces zif_fetch_entity.

  data method type string read-only.
  data path type string read-only.
  data body type xstring read-only.
  data headers type zif_fetch_entity~header_tt.
  data destination type ref to zif_fetch_destination read-only.

endinterface.
