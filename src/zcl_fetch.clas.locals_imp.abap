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

class lcl_fetch definition.
  public section.
    methods constructor importing destination type ref to zif_fetch_destination.
    interfaces zif_fetch.
  private section.
    data destination type ref to zif_fetch_destination.
endclass.

class lcl_request definition friends lcl_fetch.
  public section.
    interfaces zif_fetch_request.
    interfaces zif_throw.

    class-methods get
      importing destination   type ref to zif_fetch_destination
      returning value(result) type ref to lcl_request
      raising   cx_static_check.
  private section.
    aliases throw for zif_throw~throw.
    methods method  importing method  like zif_fetch_request~method.
    methods path    importing path    like zif_fetch_request~path.
    methods body    importing body    like zif_fetch_request~body.
    methods headers importing headers like zif_fetch_request~headers.
    methods send returning value(result) type ref to zif_fetch_response raising cx_static_check.
endclass.

class lcl_fetch implementation.
  method constructor.
    super->constructor( ).
    me->destination = destination.
  endmethod.
  method zif_fetch~fetch.
    data(request) = lcl_request=>get( me->destination ).

    " set method
    request->method( method ).
*    " set path
    request->path( path ).
    " set body
    request->body( body ).
    " set headers
    request->headers( headers ).

    .   " fetch response from request
    response = request->send( ).
  endmethod.
endclass.


class lcl_request implementation.

  method zif_throw~throw.
    new zcl_throw( )->throw( message ).
  endmethod.

  method method.
    me->zif_fetch_request~method = method.
  endmethod.

  method path.
    me->zif_fetch_request~path = path.
  endmethod.

  method body.
    me->zif_fetch_request~body = body.
  endmethod.

  method headers.
    me->zif_fetch_request~headers = headers.
  endmethod.

  method get.
    result = new #( ).
    result->zif_fetch_request~destination = destination.
  endmethod.

  method send.

    data badi type ref to zfetch_request_badi.

    data(release) = conv string( sy-saprl ).

    get badi badi
      filters
        release = release.

    call badi badi->fetch
      exporting
        request  = me
      receiving
        response = result.


  endmethod.

endclass.
