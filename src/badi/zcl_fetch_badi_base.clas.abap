class zcl_fetch_badi_base definition
  public
  abstract.

  public section.

    interfaces if_badi_interface .
    interfaces zif_fetch_badi all methods final.
    interfaces zif_throw.

  protected section.
    methods delegate abstract
    importing destination type ref to zif_fetch_destination
    returning value(result) type ref to zcl_fetch_delegate
    raising cx_static_check.
    aliases throw for zif_throw~throw.
  private section.

endclass.



class zcl_fetch_badi_base implementation.

  method zif_throw~throw.
    new zcl_throw( )->throw( message ).
  endmethod.

  method zif_fetch_badi~fetch.

    delegate( request->destination )->fetch(
      exporting
        path     = request->path
        method   = request->method
        headers  = request->headers
        body     = request->body
      receiving
        response = response
    ).

  endmethod.

endclass.
