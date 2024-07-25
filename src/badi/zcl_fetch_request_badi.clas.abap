class zcl_fetch_request_badi definition
  public
  final
  create public .

  public section.

    interfaces if_badi_interface .
    interfaces zif_fetch_request_badi .
    interfaces zif_throw.

  protected section.
  private section.
    aliases throw for zif_throw~throw.
endclass.



class zcl_fetch_request_badi implementation.

  method zif_fetch_request_badi~fetch.
    throw( 'ABAP version not supported. Please install relevant fetch plugin' ).
  endmethod.
  method zif_throw~throw.
    new zcl_throw( )->throw( message ).
  endmethod.

endclass.
