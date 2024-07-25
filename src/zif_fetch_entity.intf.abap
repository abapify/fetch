interface zif_fetch_entity
  public .

    types:
        begin of header_ts,
        name type string,
        value type string,
        end of header_ts,
        header_tt type table of header_ts with empty key.

endinterface.
