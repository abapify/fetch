*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_destination definition abstract.
  public section.
    interfaces zif_fetch_destination.
    methods constructor importing type like zif_fetch_destination~type.
  PRIVATE SECTION.
    METHODS on_request_created for event request_created of zif_fetch_client
    importing request.
    aliases defaults for zif_fetch_destination~defaults.
endclass.

class lcl_header definition.
  public section.
    interfaces zif_fetch_header.
    methods constructor importing name like zif_fetch_header~name.
  private section.
    data value type string.
endclass.

class lcl_headers definition.
public section.
interfaces zif_fetch_has_headers.
interfaces zif_fetch_headers.

private section.
   types:
      begin of headers_ts,
        key type string,
        ref type ref to zif_fetch_header,
      end of headers_ts.
    data headers type hashed table of headers_ts with unique key key.
endclass.

class lcl_defaults definition.
  public section.
    interfaces zif_fetch_defaults.
    methods constructor.
  private section.

  data headers type ref to lcl_headers.

endclass.

class lcl_destination implementation.
  method constructor.
    super->constructor( ).
    me->zif_fetch_destination~type = type.
    me->zif_fetch_destination~defaults = new lcl_defaults( ).
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
        client      = client.

    set handler on_request_created for client.

  endmethod.

   " may be this is not right to handle request in a destination
   " i need to find a better pattern/design
   " keeping it here as a concept for defaults
   " I want to make sure defauls are always applied to every request
  method on_request_created.

    check request is bound.
    data(lo_request) = cast zif_fetch_request_setter(  request ).

    " apply default headers
    data(headers) = me->defaults->headers->get( ).
    if headers is not initial.
        lo_request->headers( headers ).
    endif.


  endmethod.

endclass.


class lcl_defaults implementation.
  method zif_fetch_defaults~header.
    header = me->headers->zif_fetch_has_headers~header( name = name  ).
  endmethod.
  METHOD constructor.
    me->headers = new #( ).
    me->zif_fetch_defaults~headers = me->headers.
  ENDMETHOD.

endclass.

class lcl_headers implementation.

  method zif_fetch_has_headers~header.

    try.
        header = me->headers[ key = name ]-ref.
      catch cx_sy_itab_line_not_found.
        header = new lcl_header( name ).
        insert value #(  key = name ref = header ) into table me->headers.
    endtry.

  endmethod.

  METHOD zif_fetch_headers~get.
    result = value #(
        for wa in me->headers let header = wa-ref in
        ( name = header->name value = header->get(  ) )
    ).
  ENDMETHOD.

  METHOD zif_fetch_headers~set.
    loop at data into data(ls_header).
        me->zif_fetch_has_headers~header( name = ls_header-name  )->set( value = ls_header-value ).
    endloop.
  ENDMETHOD.

endclass.

class lcl_header implementation.
  method constructor.
    me->zif_fetch_header~name = name.
  endmethod.
  method zif_fetch_header~get.
    value = me->value.
  endmethod.
  method zif_fetch_header~set.
    me->value = value.
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
