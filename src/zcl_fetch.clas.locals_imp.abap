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

class lcl_fetch_request definition.
  public section.
   interfaces zif_fetch_request_setter.
endclass.



class lcl_fetch_request implementation.

  method zif_fetch_request_setter~method.
    me->zif_fetch_request~method = method.
  endmethod.

  method zif_fetch_request_setter~path.
    me->zif_fetch_request~path = path.
  endmethod.

  method zif_fetch_request_setter~body.
    me->zif_fetch_request~body = body.
  endmethod.

  method zif_fetch_request_setter~headers.
    me->zif_fetch_request~headers = headers.
  endmethod.

  method zif_fetch_request_setter~destination.
    me->zif_fetch_request~destination = destination.
  endmethod.

endclass.

class lcl_fetch_client definition.
  public section.
    interfaces zif_fetch_client.
endclass.

class lcl_fetch_client implementation.
  method zif_fetch_client~fetch.

    data badi type ref to zfetch_badi.

    data(release) = conv string( sy-saprl ).

    get badi badi
      filters
        release = release.

    call badi badi->fetch
      exporting
        request  = request
      receiving
        response = response.

  endmethod.

  method zif_fetch_client~request.
    result = new lcl_fetch_request(  ).
  endmethod.

endclass.



class lcl_fetch_delegate definition inheriting from zcl_fetch_delegate.
  public section.

  protected section.

    methods client redefinition.

endclass.

class lcl_fetch_delegate implementation.
  method client.
    result = new lcl_fetch_client( ).
  endmethod.
endclass.
