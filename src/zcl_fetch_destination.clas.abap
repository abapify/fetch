class zcl_fetch_destination definition
  public
  final
  abstract .

  public section.
    class-methods cloud
      importing destination   type string
      returning value(result) type ref to zif_fetch_destination_cloud.
    class-methods rfc
      importing destination   type rfcdest
      returning value(result) type ref to zif_fetch_destination_rfc.
    class-methods url
      importing url           type string
      returning value(result) type ref to zif_fetch_destination_url.
  protected section.
  private section.
endclass.



class zcl_fetch_destination implementation.
  method cloud.
    result = new lcl_destination_cloud( destination ).
  endmethod.
  method rfc.
    result = new lcl_destination_rfc( destination ).
  endmethod.
  method url.
    result = new lcl_destination_url( url ).
  endmethod.
endclass.
