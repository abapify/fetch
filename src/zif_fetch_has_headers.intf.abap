interface ZIF_FETCH_HAS_HEADERS
  public .

  methods header importing name type string returning value(header) type ref to zif_fetch_header.

endinterface.
