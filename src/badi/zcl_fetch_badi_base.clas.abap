class zcl_fetch_badi_base definition
  public
  abstract.

  public section.

    interfaces if_badi_interface .

    interfaces zif_throw.

  protected section.
  aliases throw for zif_throw~throw.
  private section.


endclass.



class zcl_fetch_badi_base implementation.

  method zif_throw~throw.
    new zcl_throw( )->throw( message ).
  endmethod.

endclass.
