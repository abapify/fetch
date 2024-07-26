class zcl_fetch_badi_fallback definition
inheriting from zcl_fetch_badi_base
  public
  final
  create public .

  public section.
  protected section.
  methods delegate redefinition.
  private section.
endclass.



class zcl_fetch_badi_fallback implementation.

  method delegate.
    throw( 'ABAP version not supported. Please install relevant fetch plugin' ).
  endmethod.

endclass.
