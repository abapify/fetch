interface ZIF_FETCH_OAPI_RESPONSE
  public .

  methods status returning value(result) type i.
  methods parse importing to type ref to data.

endinterface.
