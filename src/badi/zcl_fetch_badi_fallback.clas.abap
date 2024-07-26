class zcl_fetch_badi_fallback definition
inheriting from zcl_fetch_badi_base
  public
  final
  create public .

  public section.
  interfaces zif_fetch_badi.
  protected section.
  private section.
endclass.



class zcl_fetch_badi_fallback implementation.

  method zif_fetch_badi~fetch.
    throw( 'ABAP version not supported. Please install relevant fetch plugin' ).
  endmethod.

endclass.
