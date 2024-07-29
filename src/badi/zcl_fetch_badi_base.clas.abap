class zcl_fetch_badi_base definition
  public
  abstract.

  public section.

    interfaces if_badi_interface .
    interfaces zif_fetch_badi all methods final.

  protected section.
    methods delegate abstract
    importing destination type ref to zif_fetch_destination
    returning value(result) type ref to zcl_fetch_delegate
    raising cx_static_check.

    methods throw importing message type any raising cx_static_check.

  private section.

endclass.



class zcl_fetch_badi_base implementation.

  method zif_fetch_badi~client.

    client = delegate( destination )->client(  ).

  endmethod.

  method throw.
    new zcl_throw(  )->throw( message ).
  endmethod.

endclass.
