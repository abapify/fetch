interface ZIF_FETCH_HEADER
  public .
    methods get returning value(value) type string.
    methods set importing value type csequence.
    data name type string read-only.
endinterface.
