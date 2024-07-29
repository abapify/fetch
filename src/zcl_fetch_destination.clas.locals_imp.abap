*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_destination definition abstract.
  public section.
    interfaces zif_fetch_destination.
    methods constructor importing type like zif_fetch_destination~type.
endclass.

class lcl_destination implementation.
  method constructor.
    super->constructor( ).
    me->zif_fetch_destination~type = type.
  endmethod.
  method zif_fetch_destination~client.

     data badi type ref to zfetch_badi.

    data(release) = conv string( sy-saprl ).

    get badi badi
      filters
        release = release.

    call badi badi->client
      exporting
        destination = me
      receiving
        client = client.

  endmethod.

endclass.

class lcl_destination_url definition inheriting from lcl_destination.
  public section.
    interfaces zif_fetch_destination_url.
    methods constructor importing url like zif_fetch_destination_url~url.
endclass.

class lcl_destination_url implementation.
  method constructor.
    super->constructor( me->zif_fetch_destination_url~type ).
    me->zif_fetch_destination_url~url = url.
  endmethod.
endclass.


class lcl_destination_rfc definition inheriting from lcl_destination.
  public section.
    interfaces zif_fetch_destination_rfc.
    methods constructor importing destination like zif_fetch_destination_rfc~destination.
endclass.

class lcl_destination_rfc implementation.
  method constructor.
    super->constructor( me->zif_fetch_destination_rfc~type ).
    me->zif_fetch_destination_rfc~destination = destination.
  endmethod.
endclass.


class lcl_destination_cloud definition inheriting from lcl_destination.
  public section.
    interfaces zif_fetch_destination_cloud.
    methods constructor importing destination like zif_fetch_destination_cloud~destination.
endclass.

class lcl_destination_cloud implementation.
  method constructor.
    super->constructor( me->zif_fetch_destination_cloud~type ).
    me->zif_fetch_destination_cloud~destination = destination.
  endmethod.
endclass.
