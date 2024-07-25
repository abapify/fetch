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

endclass.



class zcl_fetch implementation.

  method by_url.
    return fetch_from( new lcl_destination_url( url ) ).
  endmethod.

  method by_destination.
    return fetch_from( new lcl_destination_rfc( destination ) ).
  endmethod.

  method fetch_from.
    return new lcl_fetch( destination ).
  endmethod.

endclass.
