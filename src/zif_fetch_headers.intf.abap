interface ZIF_FETCH_HEADERS
  public .

    types data_type type zif_fetch_entity=>header_tt.
    methods get returning value(result) type data_type.
    methods set importing data type data_type.

endinterface.
