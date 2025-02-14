interface ZIF_FETCH_OAPI
  public .

  types:
     begin of map_ts,
        name type string,
        value type string,
      end of map_ts,
      map_tt type table of map_ts with empty key.

  methods fetch
    importing
      method type string
      path type string
      body type any optional
      header type map_tt optional
      query type map_tt optional
      form_data type map_tt optional
    returning value(response) type ref to zif_fetch_response
    raising cx_static_check.



endinterface.
