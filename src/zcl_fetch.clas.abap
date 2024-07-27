"! Fetch API
class zcl_fetch definition
  public
  final
  create public .

  public section.

    "! Get fetch api by destination URL
    class-methods by_url
      importing url           type string
      returning value(result) type ref to zif_fetch.

    "! Get fetch api by HTTP RFC destination name
    class-methods by_destination
      importing destination   type rfcdest
      returning value(result) type ref to zif_fetch.

  protected section.
  private section.

    "! Get fetch api from destination
    class-methods fetch_from importing destination   type ref to zif_fetch_destination
                             returning value(result) type ref to zif_fetch.

endclass.



class zcl_fetch implementation.


  method by_destination.
    result = fetch_from( new lcl_destination_rfc( destination ) ).
  endmethod.


  method by_url.
    result = fetch_from( new lcl_destination_url( url ) ).
  endmethod.


  method fetch_from.
    result = new lcl_fetch_delegate( destination ).
  endmethod.
endclass.
