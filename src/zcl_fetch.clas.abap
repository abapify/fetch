class zcl_fetch definition
  public
  final
  create public .

  public section.

  class-methods by_url importing url type string returning value(result) type ref to zif_fetch.
  class-methods by_destination importing destination type rfcdest returning value(result) type ref to zif_fetch.

  protected section.
  private section.

  class-methods fetch_from importing destination type ref to zif_fetch_destination
  returning value(result) type ref to zif_fetch.

ENDCLASS.



CLASS ZCL_FETCH IMPLEMENTATION.


  method by_destination.
    result = fetch_from( new lcl_destination_rfc( destination ) ).
  endmethod.


  method by_url.
    result = fetch_from( new lcl_destination_url( url ) ).
  endmethod.


  method fetch_from.
    result = new lcl_fetch_delegate( destination ).
  endmethod.
ENDCLASS.
