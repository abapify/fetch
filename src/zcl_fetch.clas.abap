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
    class-methods by_rfc_destination
      importing destination   type rfcdest
      returning value(result) type ref to zif_fetch.

   "! Get fetch api by Cloud destination name
    class-methods by_cloud_destination
      importing destination   type string
      returning value(result) type ref to zif_fetch.

  protected section.
  private section.

    "! Get fetch api from destination
    class-methods fetch_from importing destination   type ref to zif_fetch_destination
                             returning value(result) type ref to zif_fetch.

endclass.



class zcl_fetch implementation.


  method by_rfc_destination.
    result = fetch_from( zcl_fetch_destination=>rfc( destination ) ).
  endmethod.


  method by_url.
    result = fetch_from( zcl_fetch_destination=>url( url )  ).
  endmethod.

    method by_cloud_destination.
    result = fetch_from( zcl_fetch_destination=>cloud( destination ) ).
  endmethod.

  method fetch_from.
    result = new lcl_fetch_delegate( destination ).
  endmethod.

endclass.
