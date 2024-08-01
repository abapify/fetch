class zcl_fetch_delegate definition
  public
  abstract.

  public section.

    methods constructor importing destination type ref to zif_fetch_destination.

    methods client abstract
      returning value(result) type ref to zif_fetch_client
      raising   cx_static_check .
    interfaces zif_fetch all methods final.
    aliases fetch for zif_fetch~fetch.
protected section.

  data DESTINATION type ref to ZIF_FETCH_DESTINATION .

  methods THROW final
    importing
      !MESSAGE type ANY optional raising cx_static_check .
  private section.

ENDCLASS.



CLASS ZCL_FETCH_DELEGATE IMPLEMENTATION.


  method constructor.
    super->constructor( ).
    me->destination = destination.
  endmethod.


  method THROW.
    new zcl_throw( )->throw( message ).
  endmethod.


  method zif_fetch~fetch.

    data(client)  = client( ).
    data(request) = client->request( ).

    " set method
    request->method( method ).
*    " set path
    request->path( path ).
    " set body
    request->body( body ).
    " set headers
    request->headers( headers ).
    " fetch response from request
    response = client->fetch( request ).


  endmethod.
ENDCLASS.
